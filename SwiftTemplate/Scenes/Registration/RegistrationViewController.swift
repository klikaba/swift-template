//
//  RegistrationViewController.swift
//  SwiftTemplate
//
//  Created by Haris Dizdarevic on 08/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit
import Bond

class RegistrationViewController: AppViewController<RegistrationViewModel> {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func bindViewModel() {
        super.bindViewModel()

        // Input bind
        viewModel.username.bidirectionalBind(to: usernameTextField.reactive.text)
        viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text)

        registerButton.reactive.tapGesture().observeNext { [weak self] _ in
            self?.viewModel.doRegistration()
        }.dispose(in: bag)
    }
}
