class CountriesRepositoryFactory {
    private let repository: CountriesRepository
    private let database: CountryDAO
    private let network: CountriesApiClient
    private let mapper: CountryMapper

    init() {
        self.database = CountryDAO()
        self.network = CountriesApiClient()
        self.mapper = CountryMapper()
        self.repository = CountriesRepository(database: database, network: network, mapper: mapper)
    }

    func create() -> CountriesRepository {
        return repository
    }
}
