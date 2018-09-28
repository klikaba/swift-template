//
//  HomeViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 7/1/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class HomeViewController: AppViewControler<HomeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.refreshCountries()
    }

    override func bindViewModel() {
        super.bindViewModel()

    }
}
