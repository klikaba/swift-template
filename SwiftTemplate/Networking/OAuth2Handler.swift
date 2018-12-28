//
//  OAuth2Handler.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/30/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//
import Alamofire

class OAuth2Handler: RequestAdapter, RequestRetrier {
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: AccessToken?) -> Void

    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders

        return SessionManager(configuration: configuration)
    }()

    private let lock = NSLock()
    private static let serverProto: String = "\(AppConfiguration.sharedInstance().serverProto)://"
    private static let serverUrl: String = "\(AppConfiguration.sharedInstance().serverUrl)"
    private let baseURLString: String = "\(serverProto)\(serverUrl)"

    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []

    public init() {
    }

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(baseURLString),
            let token = SessionStore.currentSession.get() {
                var urlRequest = urlRequest
                urlRequest.setValue("Bearer " + token.accessToken, forHTTPHeaderField: "Authorization")
                return urlRequest
        }

        return urlRequest
    }

    func should(_ manager: SessionManager, retry request: Request, with error: Error,
                completion: @escaping RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }

        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            requestsToRetry.append(completion)

            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessTokenObj in
                    guard let strongSelf = self else { return }

                    strongSelf.lock.lock() ; defer { strongSelf.lock.unlock() }

                    if let token = accessTokenObj {
                        SessionStore.currentSession.save(accessToken: token)
                    }

                    strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                    strongSelf.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(false, 0.0)
        }
    }

    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }

        isRefreshing = true

        let urlString: String = "\(baseURLString)/oauth/token"
        let token: AccessToken? = SessionStore.currentSession.get()
        let parameters: [String: Any] = [
            "refresh_token": token!.refreshToken,
            "client_id": AppConfiguration.sharedInstance().apiClient,
            "client_secret": AppConfiguration.sharedInstance().apiSecret,
            "grant_type": "refresh_token"
        ]

        sessionManager.request(urlString, method: .post, parameters: parameters).validate()
            .responseObject { [weak self] (response: DataResponse<AccessToken>) in
                guard let strongSelf = self else { return }
                if response.result.isSuccess {
                    completion(true, response.value)
                } else {
                    completion(false, nil)
                }
                strongSelf.isRefreshing = false
        }

    }
}
