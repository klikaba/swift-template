//
//  LoginManager.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/31/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

typealias LoginServiceLoginCompletion = (_ error: ApiError?) -> Void

class LoginService {

    var loginCompletionHandler: LoginServiceLoginCompletion?

    func signIn(username: String, password: String,
                loginCompletionHandler: @escaping LoginServiceLoginCompletion) {
        self.loginCompletionHandler = loginCompletionHandler
        CountriesApiClient().signIn(username: username,
                                    password: password,
                                    callback: onSignInCompleted)
    }

    private func onSignInCompleted(accessToken: AccessToken?, error: ApiError?) {
        if let accessToken = accessToken {
            SessionStore.save(accessToken: accessToken)
        }
        loginCompletionHandler?(error)
    }
}
