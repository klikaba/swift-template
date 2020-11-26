import Foundation
import RealmSwift
import Realm

class DBUser: Object {
    @objc dynamic
    // swiftlint:disable:next identifier_name
    var id: String = ""
    @objc dynamic
    var name: String = ""
    @objc dynamic
    var nickname: String = ""
    @objc dynamic
    var email: String = ""
    @objc dynamic
    var goldToSend: Int = 0
    @objc dynamic
    var goldReceived: Int = 0

    override class func primaryKey() -> String? {
        return "id"
    }

    // swiftlint:disable:next identifier_name
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
