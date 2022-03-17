import Foundation

struct User: Codable {
    // swiftlint:disable superfluous_disable_command identifier_name
    var id: String
    var name: String
    var nickname: String
    var email: String
    var goldToSend: Int
    var goldReceived: Int
}
