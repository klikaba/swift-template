//
//  WelcomeViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation

class WelcomeViewModel: AppViewModel {
    public func isLoggedIn() -> Bool {
        return SessionStore.get() != nil
    }
}
