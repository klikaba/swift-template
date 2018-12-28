//
//  SwiftTemplateTests.swift
//  SwiftTemplateTests
//
//  Created by Haris Dizdarevic on 27/10/2018.
//  Copyright © 2018 Klika d.o.o. Sarajevo. All rights reserved.
//

import XCTest
@testable import SwiftTemplate

class WelcomeViewModelTest: XCTestCase {
    var welcomeViewModel: WelcomeViewModel!
    var welcomeNavigator: WelcomeNavigatorMock!
    var sessionStore: SessionStoreMock!

    override func setUp() {
        welcomeNavigator = WelcomeNavigatorMock()
        sessionStore = SessionStoreMock()
        welcomeViewModel = WelcomeViewModel(welcomeNavigator: welcomeNavigator, session: sessionStore)
    }

    override func tearDown() {
        welcomeViewModel = nil
        welcomeNavigator = nil
        sessionStore = nil
    }

    func testCheckLoginStatus() {
        welcomeViewModel.checkLoginStatus()
        XCTAssertFalse(welcomeNavigator.goHomeCalled)
    }

    func testOnLoginClicked() {
        welcomeViewModel.onLoginClicked()
        XCTAssertTrue(welcomeNavigator.goToLoginCalled)
    }

    func testOnRegisterClicked() {
        welcomeViewModel.onRegisterClicked()
        XCTAssertTrue(welcomeNavigator.goToRegistrationCalled)
    }
}
