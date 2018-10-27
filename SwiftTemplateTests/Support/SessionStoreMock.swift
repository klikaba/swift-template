@testable import SwiftTemplate

class SessionStoreMock: SessionStoreProtocol {
    var saveCalled: Bool = false
    var clearCalled: Bool = false

    func save(accessToken: AccessToken) {
        saveCalled = true
    }

    func get() -> AccessToken? {
        return nil
    }

    func clear() {
        clearCalled = true
    }
}
