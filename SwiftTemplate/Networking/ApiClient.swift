//
//  ApiClient.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/28/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ApiClient {
    static let sessionManager: SessionManager = {
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        defaultHeaders["Content-Type"] = "application/json"
        defaultHeaders["Accept"] = "application/json"

        // Move to xconfig
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        configuration.timeoutIntervalForRequest = 15

        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        let oauth2Handler = OAuth2Handler()
        sessionManager.adapter = oauth2Handler
        sessionManager.retrier = oauth2Handler
        return sessionManager
    }()

    func buildUrl(_ path: String) -> String {
        return "\(AppConfiguration.sharedInstance().serverProto):" +
               "//\(AppConfiguration.sharedInstance().serverUrl)\(path)"
    }

    func callApi<ApiModel: Mappable>(using method: HTTPMethod,
                                     with parameters: [String: Any]?,
                                     for path: String,
                                     callback: @escaping (_ data: ApiModel?, _ error: ApiError?) -> Void) {
        ApiClient.sessionManager.request(buildUrl(path), method: method, parameters: parameters).validate()
            .responseObject { (response: DataResponse<ApiModel>) in
                debugPrint(response)
                callback(response.value, ApiError.fromDataResponse(response: response))
        }
    }
}
