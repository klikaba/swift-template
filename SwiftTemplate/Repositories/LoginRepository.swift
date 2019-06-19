//
//  LoginManager.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/31/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

typealias LoginServiceLoginCompletion = (_ error: ApiError?) -> Void

protocol LoginRepositoryProtocol {
     func signIn(username: String, password: String)
}

class LoginRepository: LoginRepositoryProtocol {
    var loginCompletionHandler: LoginServiceLoginCompletion?
    var currentSession = SessionStore.currentSession

    func signIn(username: String, password: String) {
        UserApiClient().signIn(username: username,
                                    password: password,
                                    callback: onSignInCompleted)
    }

    private func onSignInCompleted(_ accessToken: AccessToken?, _ error: ApiError?) {
        if let accessToken = accessToken {
            currentSession.save(accessToken: accessToken)
        }
        loginCompletionHandler?(error)
    }
}
