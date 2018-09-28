//
//  AppStoryBoard.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

enum AppStoryboard: String {

    case welcome = "Welcome"
    case login = "Login"
    case home = "Home"

    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }

    // swiftlint:disable force_cast
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    // swiftlint:enable force_cast

    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
