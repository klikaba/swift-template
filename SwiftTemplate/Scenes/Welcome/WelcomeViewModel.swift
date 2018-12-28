//
//  WelcomeViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

class WelcomeViewModel: AppViewModel {
    var onLoginStatus: ((_ isLogedIn: Bool) -> Void)?
    private let welcomeNavigator: WelcomeNavigatorProtocol
    let session: SessionStoreProtocol

    init(welcomeNavigator: WelcomeNavigatorProtocol,
         session: SessionStoreProtocol = SessionStore.currentSession ) {
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
