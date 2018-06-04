//
//  ViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/24/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LoginManager().signIn(username: "test@test.com",
                              password: "test123",
                              loginCompletionHandler: onLoginCompleted)
    }

    func onLoginCompleted(error: ApiError?) {

    }
}
