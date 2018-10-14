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
    let loginRepo: LoginRepository!
    let navigator: LoginNavigator
    // Input
    var username = Property<String?>("")
    var password = Property<String?>("")

    // Output

    init(loginRepo: LoginRepository, navigator: LoginNavigator) {
        self.loginRepo = loginRepo
        self.navigator = navigator
        super.init()
        self.loginRepo.loginCompletionHandler = onLoginCompletedHandler
    }

    func doLogin() {
        loginRepo.signIn(username: username.value!, password: password.value!)
    }

    func onLoginCompletedHandler(_ error: ApiError?) {
        self.error.value = error
        if error == nil {
            navigator.goToHome()
        }
    }
}
