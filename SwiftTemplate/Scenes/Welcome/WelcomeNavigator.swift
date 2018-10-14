//
//  WelcomeNavigator.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class WelcomeNavigator: AppNavigator {
    func goToRegistration() {
        let registrationVC = RegistrationViewController.instantiateFromAppStoryboard(appStoryboard:
                                                                                     .registration)
        let registrationNavigator = RegistrationNavigator(navigationController: navigationController)
        registrationVC.viewModel = RegistrationViewModelFactory(navigator: registrationNavigator).create()
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(registrationVC, animated: true)
    }
}
