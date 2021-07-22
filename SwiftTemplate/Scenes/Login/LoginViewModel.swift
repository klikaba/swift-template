//
//  LoginViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ReactiveKit

class LoginViewModel: AppViewModel {
    private let loginRepository: LoginRepository!
    private let loginNavigator: AppNavigatorProtocol

    // Input
    let username = Property<String?>("")
    let password = Property<String?>("")

    init(loginRepository: LoginRepository, loginNavigator: AppNavigatorProtocol) {
        self.loginRepository = loginRepository
        self.loginNavigator = loginNavigator
        super.init()
        self.loginRepository.loginCompletionHandler = { [weak self] (error) in
            self?.onLoginCompletedHandler(error)
        }
    }

    func doLogin() {
        loginRepository.signIn(username: username.value!, password: password.value!)
    }

    private func onLoginCompletedHandler(_ error: ApiError?) {
        self.error.value = error
        if error == nil {
            loginNavigator.goToHome()
        }
    }
}
