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
    let registrationRepo: UserRepository!
    let navigator: RegistrationNavigator!

    // Input
    var username = Property<String?>("")
    var password = Property<String?>("")

    init(registrationRepo: UserRepository, navigator: RegistrationNavigator) {
        self.registrationRepo = registrationRepo
        self.navigator = navigator
        super.init()
        self.registrationRepo.userActionCompletionHandler = onUserActionCompletedHandler
    }

    func doRegistration() {
        registrationRepo.create(username: username.value!, password: password.value!)
    }

    func onUserActionCompletedHandler(_ error: ApiError?) {
        self.error.value = error
        if error == nil {
            navigator.goToLogin()
        }
    }
}
