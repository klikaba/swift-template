class UserRepositoryFactory {
    private let repository: UserRepository
    private let database: UserDAO
    private let network: UserApiClient
    private let mapper: UserMapper

    init() {
        self.database = UserDAO()
        self.network = UserApiClient()
        self.mapper = UserMapper()
        self.repository = UserRepository(database: database, network: network, mapper: mapper)
    }

    func create() -> UserRepository {
        return repository
    }
}
