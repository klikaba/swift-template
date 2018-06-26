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
        if let viewController = UIStoryboard(name: "Login", bundle: nil)
            .instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            context.navigationController?.setNavigationBarHidden(false, animated: false)
            context.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
