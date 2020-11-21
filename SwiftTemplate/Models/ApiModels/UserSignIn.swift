import Foundation

struct UserSignIn: Codable {
    let grantType: GrantType
    let username: String
    let password: String?

    enum GrantType: String, Codable {
        case password
        case biometry
    }
}
