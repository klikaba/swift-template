import Foundation
import RealmSwift

class DBCountry: Object {

    @objc dynamic
    // swiftlint:disable:next identifier_name
    var id: String = ""

    @objc dynamic
    var name: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }

    required override init() { super.init() }

    init(name: String, code: String) {
        super.init()
        self.id = code
        self.name = name
    }
}
