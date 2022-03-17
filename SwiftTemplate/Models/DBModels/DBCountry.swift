import Foundation
import RealmSwift

class DBCountry: Object {
    @Persisted(primaryKey: true) var id: String = ""
    @Persisted var name: String = ""

    required override init() { super.init() }

    init(name: String, code: String) {
        super.init()
        self.id = code
        self.name = name
    }
}
