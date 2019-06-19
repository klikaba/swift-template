@testable import SwiftTemplate

class WelcomeNavigatorMock: AppNavigatorMock, WelcomeNavigatorProtocol {
    var goToRegistrationCalled: Bool = false

    func goToRegistration() {
        goToRegistrationCalled = true
    }
}
