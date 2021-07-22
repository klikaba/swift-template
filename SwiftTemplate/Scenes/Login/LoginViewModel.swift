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
    }

    func doLogin() {
        loginRepository.signIn(username: username.value!, password: password.value!) { [weak self] error in
            if let error = error {
                self?.error.value = error
                return
            }
            self?.loginNavigator.goToHome()
        }
    }
}
