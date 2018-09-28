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

    func checkLoginStatus() {
        onLoginStatus?(SessionStore.get() != nil)
    }
}
