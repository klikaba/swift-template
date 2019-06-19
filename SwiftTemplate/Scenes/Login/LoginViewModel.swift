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
    let loginRepository: LoginRepository!
    let loginNavigator: AppNavigatorProtocol
    // Input
    var username = Property<String?>("")
    var password = Property<String?>("")

    // Output

    init(loginRepository: LoginRepository, loginNavigator: AppNavigatorProtocol) {
        self.loginRepository = loginRepository
        self.loginNavigator = loginNavigator
        super.init()
        self.loginRepository.loginCompletionHandler = onLoginCompletedHandler
    }

    func doLogin() {
        loginRepository.signIn(username: username.value!, password: password.value!)
    }

    func onLoginCompletedHandler(_ error: ApiError?) {
        self.error.value = error
        if error == nil {
            loginNavigator.goToHome()
        }
    }
}
