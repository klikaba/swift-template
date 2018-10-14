//
//  AppViewController.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import UIKit

class AppViewController<TViewModel: AppViewModel>: UIViewController {

    var viewModel: TViewModel!

    override func viewDidLoad() {
        bindViewModel()
    }

    func bindViewModel() {
        _ = viewModel.error.observeNext { (error) in
            self.showError(error: error)
        }
    }

    func showError(error: AppError?) {
        guard let error = error else {
            return
        }

        let alert = UIAlertController(title: "Alert", message: error.message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
