//
//  ViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/24/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class WelcomeViewController: AppViewController<WelcomeViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.checkLoginStatus()
    }

    @IBAction func onRegisterClicked(_ sender: Any) {
        viewModel.onRegisterClicked()
    }

    @IBAction func onLoginClicked(_ sender: Any) {
        viewModel.onLoginClicked()
    }
}
