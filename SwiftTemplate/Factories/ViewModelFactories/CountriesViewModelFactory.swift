class CountriesViewModelFactory {
    private let repository: CountriesRepository
    private let viewModel: CountriesViewModel

    init() {
        self.repository = CountriesRepositoryFactory().create()
        self.viewModel = CountriesViewModel(countriesRepo: repository)
    }

    func create() -> CountriesViewModel {
        return viewModel
    }
}
