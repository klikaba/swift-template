class CountriesRepositoryFactory {
    static func create() -> CountriesRepository {
        return CountriesRepository(
            countryDAO: CountryDAO(),
            countriesAPIClient: CountriesApiClient(),
            countryMapper: CountryMapper()
        )
    }
}
