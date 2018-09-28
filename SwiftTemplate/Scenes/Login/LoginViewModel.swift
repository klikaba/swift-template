//
//  LoginViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class LoginViewModel: AppViewModel {
    // Input
    var username = Property<String?>("")
    var password = Property<String?>("")

    // Output
    var onLoginCompleted: ((_ error: ApiError?) -> Void)?

    func doLogin() {
        let loginRepo = LoginRepository(loginCompletionHandler: onLoginCompletedHandler)
        loginRepo.signIn(username: username.value!, password: password.value!)
    }

    func onLoginCompletedHandler(_ error: ApiError?) {
        self.error.value = error
        onLoginCompleted?(error)
    }
}
