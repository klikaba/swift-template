//
//  LoginViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: AppViewControler<LoginViewModel> {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func onLoginSucceed() {
        self.showError(error: AppError(code: -1, message: "Login ok"))
    }

    // MARK: Binding interface
    override func bindViewModel() {
        super.bindViewModel()
        // Input
        usernameTextField.rx.text.orEmpty.bind(to: viewModel.username).disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.password).disposed(by: disposeBag)

        // Output
        viewModel.isLoginButtonEnabled.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        viewModel.loginCompletion.asObservable().subscribe(onNext: { error in
            print("DONE \(String(describing: error))")
        }).disposed(by: disposeBag)

    }

    @IBAction func onLoginClicked(_ sender: Any) {
        viewModel.doLogin()
    }
}
