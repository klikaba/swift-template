//
//  UserApiClient.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class UserApiClient: ApiClient {

    func signIn(username: String, password: String,
                callback: @escaping (_ accessToken: AccessToken?, _ error: ApiError?) -> Void) {
        let parameters: Parameters = ["grant_type": "password",
                                      "username": username,
                                      "password": password,
                                      "client_id": AppConfiguration.sharedInstance().apiClient,
                                      "client_secret": AppConfiguration.sharedInstance().apiSecret]
        callApi(using: .post, with: parameters, for: "/oauth/token", callback: callback)
    }

    func create(username: String,
                password: String,
                callback: @escaping (_ user: User?, _ error: ApiError?) -> Void) {
        let parameters: [String: Any] = ["user": ["email": username, "password": password]]
        callApi(using: .post, with: parameters, for: "/api/v1/users", callback: callback)
    }

    func getUser(identifier: String, callback: @escaping (_ user: User?, _ error: ApiError?) -> Void) {
        callApi(using: .get, with: nil, for: identifier, callback: callback)
    }
}
