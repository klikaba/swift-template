class RegistrationViewModelFactory {
    private let viewModel: RegistrationViewModel
    private let repository: UserRepository

    init(navigator: RegistrationNavigator) {
        self.repository = UserRepositoryFactory().create()
        self.viewModel = RegistrationViewModel(registrationRepo: repository, navigator: navigator)
    }

    func create() -> RegistrationViewModel {
        return viewModel
    }
}
