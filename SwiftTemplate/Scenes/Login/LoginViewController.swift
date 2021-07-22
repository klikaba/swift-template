//
//  LoginViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond

class LoginViewController: AppViewController<LoginViewModel> {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func bindViewModel() {
        super.bindViewModel()

        viewModel.username.bidirectionalBind(to: usernameTextField.reactive.text)
        viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text)

        loginButton.reactive.tapGesture().observeNext { [weak self] _ in
            self?.viewModel.doLogin()
        }.dispose(in: bag)
    }
}
