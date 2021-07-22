//
//  ViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 5/24/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class WelcomeViewController: AppViewController<WelcomeViewModel> {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.checkLoginStatus()
    }

    override func bindViewModel() {
        super.bindViewModel()

        loginButton.reactive.tapGesture().observeNext { [weak self] _ in
            self?.viewModel.onLoginClicked()
        }.dispose(in: bag)

        registerButton.reactive.tapGesture().observeNext { [weak self] _ in
            self?.viewModel.onRegisterClicked()
        }.dispose(in: bag)
    }
}
