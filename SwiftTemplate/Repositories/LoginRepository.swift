//
//  LoginManager.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/31/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

typealias LoginServiceLoginCompletion = (_ error: ApiError?) -> Void

class LoginRepository {

    var loginCompletionHandler: LoginServiceLoginCompletion?

    init(loginCompletionHandler: LoginServiceLoginCompletion?) {
        self.loginCompletionHandler = loginCompletionHandler
    }

    func signIn(username: String, password: String) {
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
