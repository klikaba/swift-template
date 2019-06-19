@testable import SwiftTemplate

class AppNavigatorMock: AppNavigatorProtocol {
    var goHomeCalled: Bool = false
    var goToWelcomeCalled: Bool = false
    var goToLoginCalled: Bool = false

    func goToHome() {
        goHomeCalled = true
    }

    func goToWelcome() {
        goToWelcomeCalled = true
    }

    func goToLogin() {
        goToLoginCalled = true
    }
}
