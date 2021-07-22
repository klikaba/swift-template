import Foundation
import Alamofire

class OAuth2Handler: RequestInterceptor {
    private var sessionManager: Session {
        return ApiClient.sessionManager
    }

    private let lock = NSLock()
    private static let serverUrl = AppConfiguration.sharedInstance().serverUrl

    private var isRefreshing = false
    private var requestsToRetry: [((RetryResult) -> Void)] = []

    init() {}

    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(OAuth2Handler.serverUrl),
           let token = SessionStore.currentSession.get()?.accessToken {
            var urlRequest = urlRequest
            urlRequest.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
            completion(.success(urlRequest))
            return
        }
        completion(.success(urlRequest))
    }

    func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void
    ) {
        lock.lock() ; defer { lock.unlock() }
        if let response = request.task?.response as? HTTPURLResponse,
            SessionStore.currentSession.get() != nil,
            response.statusCode == 401 {
            requestsToRetry.append(completion)

            if !isRefreshing {
                refreshTokens { [weak self] accessTokenObj in
                    guard let self = self else { return }
                    self.lock.lock() ; defer { self.lock.unlock() }
                    if let token = accessTokenObj {
                        SessionStore.currentSession.save(accessToken: token)
                        self.requestsToRetry.forEach { $0(.retry) }
                    } else {
                        self.requestsToRetry.forEach { $0(.doNotRetryWithError(error)) }
                    }
                    self.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(.doNotRetryWithError(error))
        }
    }

    private func refreshTokens(completion: @escaping (AccessToken?) -> Void) {
        guard !isRefreshing else { return }

        isRefreshing = true

        var url = URL(string: AppConfiguration.sharedInstance().serverUrl)!
        url.appendPathComponent("oauth")
        url.appendPathComponent("token")
        let token: AccessToken? = SessionStore.currentSession.get()

        let params = TokenRequest(
            refreshToken: token?.refreshToken ?? "",
            clientId: AppConfiguration.sharedInstance().apiClient,
            clientSecret: AppConfiguration.sharedInstance().apiSecret,
            grantType: .refreshToken
        )

        sessionManager.request(
            url,
            method: .post,
            parameters: params
        )
        .validate()
        .responseDecodable { [weak self] (response: DataResponse<AccessToken, AFError>) in
            switch response.result {
            case .success(let token):
                completion(token)
            case .failure:
                completion(nil)
            }
            guard let self = self else { return }
            self.isRefreshing = false
        }
    }
}
