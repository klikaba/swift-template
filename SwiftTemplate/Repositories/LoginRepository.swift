//
//  LoginManager.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/31/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

typealias LoginCallback = (_ error: ApiError?) -> Void

protocol LoginRepositoryProtocol {
     func signIn(username: String, password: String, callback: @escaping LoginCallback)
}

class LoginRepository: LoginRepositoryProtocol {
    private let apiClient: UserApiClient

    init(apiClient: UserApiClient = UserApiClient()) {
        self.apiClient = apiClient
    }

    func signIn(username: String, password: String, callback: @escaping LoginCallback) {
        apiClient.signIn(username: username, password: password) { token, error in
            if let accessToken = token {
                SessionStore.currentSession.save(accessToken: accessToken)
            }
            callback(error)
        }
    }
}
