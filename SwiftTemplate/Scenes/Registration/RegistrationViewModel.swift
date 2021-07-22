//
//  RegistrationViewModel.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ReactiveKit

class RegistrationViewModel: AppViewModel {
    private let userRepository: UserRepository!
    private let registrationNavigator: AppNavigatorProtocol!

    let username = Property<String?>("")
    let password = Property<String?>("")

    init(userRepository: UserRepository, registrationNavigator: AppNavigatorProtocol) {
        self.userRepository = userRepository
        self.registrationNavigator = registrationNavigator
        super.init()
    }

    func doRegistration() {
        userRepository.create(username: username.value!, password: password.value!) { [weak self] error in
            if let error = error {
                self?.error.value = error
                return
            }
            self?.registrationNavigator.goToLogin()
        }
    }
}
