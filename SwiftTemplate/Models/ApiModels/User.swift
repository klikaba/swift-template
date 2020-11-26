import Foundation

struct User: Codable {
     // swiftlint:disable:next identifier_name
    var id: String
    var name: String
    var nickname: String
    var email: String
    var goldToSend: Int
    var goldReceived: Int
}
