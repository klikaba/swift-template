//
//  WelcomeViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

class WelcomeViewModel: AppViewModel {
    private let welcomeNavigator: WelcomeNavigatorProtocol
    private let session: SessionStoreProtocol

    var onLoginStatus: ((_ isLogedIn: Bool) -> Void)?

    init(
        welcomeNavigator: WelcomeNavigatorProtocol,
        session: SessionStoreProtocol = SessionStore.currentSession
    ) {
        self.welcomeNavigator = welcomeNavigator
        self.session = session
    }

    func checkLoginStatus() {
        if session.get() != nil {
            welcomeNavigator.goToHome()
        }
    }

    func onLoginClicked() {
        welcomeNavigator.goToLogin()
    }

    func onRegisterClicked() {
        welcomeNavigator.goToRegistration()
    }
}
