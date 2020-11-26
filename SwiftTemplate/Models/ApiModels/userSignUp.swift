import Foundation

struct UserSignUp: Codable {
    let user: User

    struct User: Codable {
        let email: String
        let password: String
    }
}
