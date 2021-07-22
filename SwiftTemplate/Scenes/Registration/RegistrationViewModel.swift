//
//  RegistrationViewModel.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import ReactiveKit
import Bond

class RegistrationViewModel: AppViewModel {
    let userRepository: UserRepository!
    let registrationNavigator: AppNavigatorProtocol!

    // Input
    var username = Property<String?>("")
    var password = Property<String?>("")

    init(userRepository: UserRepository, registrationNavigator: AppNavigatorProtocol) {
        self.userRepository = userRepository
        self.registrationNavigator = registrationNavigator
        super.init()
        self.userRepository.userActionCompletionHandler = { [weak self] (error) in
            self?.onUserActionCompletedHandler(error)
        }
    }

    func doRegistration() {
        userRepository.create(username: username.value!, password: password.value!)
    }

    func onUserActionCompletedHandler(_ error: ApiError?) {
        self.error.value = error
        if error == nil {
            registrationNavigator.goToLogin()
        }
    }
}
