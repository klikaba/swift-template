//
//  RegistrationViewController.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class RegistrationViewController: AppViewController<RegistrationViewModel> {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func bindViewModel() {
        super.bindViewModel()

        // Input bind
        viewModel.username.bidirectionalBind(to: usernameTextField.reactive.text)
        viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text)
    }

    @IBAction func onRegisterClicked(_ sender: Any) {
        viewModel.doRegistration()
    }
}
