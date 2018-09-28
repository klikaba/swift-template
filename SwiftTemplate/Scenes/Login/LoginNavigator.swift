//
//  LoginNavigator.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class LoginNavigator {
    func goToHome(context: UIViewController) {
        let homeViewController = HomeViewController.instantiateFromAppStoryboard(appStoryboard: .home)
        context.present(homeViewController, animated: false)
    }
}
