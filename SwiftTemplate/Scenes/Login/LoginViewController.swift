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

class LoginViewController: AppViewControler<LoginViewModel> {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func bindViewModel() {
        super.bindViewModel()

        viewModel.onLoginCompleted = onLoginCompleted

        // Input bind
        viewModel.username.bidirectionalBind(to: usernameTextField.reactive.text)
        viewModel.password.bidirectionalBind(to: passwordTextField.reactive.text)
    }

    func onLoginCompleted(_ error: ApiError?) {
        if error == nil {
            LoginNavigator().goToHome(context: self)
        }
    }

    @IBAction func onLoginClicked(_ sender: Any) {
        viewModel.doLogin()
    }
}
