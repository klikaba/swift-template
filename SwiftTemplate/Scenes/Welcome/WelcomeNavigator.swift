//
//  WelcomeNavigator.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class WelcomeNavigator {
    func goToLogin(context: UIViewController) {
        let loginViewController = LoginViewController.instantiateFromAppStoryboard(appStoryboard: .login)
        context.navigationController?.setNavigationBarHidden(false, animated: false)
        context.navigationController?.pushViewController(loginViewController, animated: true)
    }

    func goToHome(context: UIViewController) {
        let homeViewController = HomeViewController.instantiateFromAppStoryboard(appStoryboard: .home)
        context.present(homeViewController, animated: false)
    }
}
