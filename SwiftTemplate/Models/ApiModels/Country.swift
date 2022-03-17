import Foundation

struct Country: Codable {
    // swiftlint:disable superfluous_disable_command identifier_name
    var id: String = ""
    var name: String = ""

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    init?(JSON: [String: Any]) {
        guard let id = JSON["code"] as? String else { return nil }
        guard let name = JSON["name"] as? String else { return nil }
        self.init(id: id, name: name)
    }
}
