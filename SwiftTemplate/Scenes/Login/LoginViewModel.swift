//
//  LoginViewModel.swift
//  SwiftTemplate
//
//  Created by zaharijepasalic on 6/8/18.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel: AppViewModel {
    // Input
    var username = Variable<String>("")
    var password = Variable<String>("")

    // Output
    var loginCompletion = BehaviorSubject<AppError?>(value: nil)

    var isLoginEnabled: Observable<Bool> {
        return Observable.combineLatest(self.username.asObservable(),
                                        self.password.asObservable()) { (username, password) in
            return username.count > 0 && password.count > 0
        }

    }

    func doLogin() {
        LoginService().signIn(username: username.value,
                              password: password.value,
                              loginCompletionHandler: onLoginCompleted(_:))
    }

    func onLoginCompleted(_ error: ApiError?) {
        loginCompletion.onNext(error)
    }
}
