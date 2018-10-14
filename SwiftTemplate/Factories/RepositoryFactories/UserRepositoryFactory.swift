class UserRepositoryFactory {
    static func create() -> UserRepository {
        return UserRepository(userDAO: UserDAO(), userAPIClient: UserApiClient(), userMapper: UserMapper())
    }
}
