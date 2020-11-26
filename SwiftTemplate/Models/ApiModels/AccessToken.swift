import Foundation

struct AccessToken: Codable {
    let accessToken: String?
    let refreshToken: String?
    let tokenType: String?
    let expiresIn: Int?
    let createdAt: Int?
    let userId: Int?
    let error: String?
    let errorDescription: String?
}
