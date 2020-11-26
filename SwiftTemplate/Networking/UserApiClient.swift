//
//  UserApiClient.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Alamofire

class UserApiClient: ApiClient {

    func create(username: String,
                password: String,
                callback: @escaping (_ user: User?, _ error: ApiError?) -> Void) {
        let parameters = UserSignUp(user: UserSignUp.User(email: username, password: password))

        makeRequest(using: .post,
                    body: parameters,
                    path: "api/v1/users",
                    callback: callback)

    }

    func getUser(identifier: String, callback: @escaping (_ user: User?, _ error: ApiError?) -> Void) {
        makeRequest(using: .post,
                    body: nil,
                    path: identifier,
                    callback: callback)
    }

    func signIn(username: String, password: String,
                callback: @escaping (_ accessToken: AccessToken?, _ error: ApiError?) -> Void) {
        let parameters = UserSignIn(grantType: .password, username: username, password: password)
        makeRequest(using: .post,
                    body: parameters,
                    path: "/oauth/token",
                    callback: callback)
    }
}
