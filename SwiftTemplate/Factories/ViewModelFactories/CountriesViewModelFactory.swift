class CountriesViewModelFactory {
    static func create() -> CountriesViewModel {
        let countriesRepository = CountriesRepositoryFactory.create()
        return CountriesViewModel(countriesRepository: countriesRepository)
    }
}
