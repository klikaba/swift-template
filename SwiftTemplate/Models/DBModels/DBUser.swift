import Foundation
import RealmSwift

class DBUser: Object {
    // swiftlint:disable superfluous_disable_command identifier_name
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String = ""
    @Persisted var nickname: String = ""
    @Persisted var email: String = ""
    @Persisted var goldToSend: Int = 0
    @Persisted var goldReceived: Int = 0

    required override init() { super.init() }

    // swiftlint:disable superfluous_disable_command identifier_name
    init(id: String, name: String, nickname: String, email: String, goldToSend: Int, goldReceived: Int) {
        super.init()
        self.id = id
        self.name = name
        self.nickname = nickname
        self.email = email
        self.goldToSend = goldToSend
        self.goldReceived = goldReceived
    }
}
