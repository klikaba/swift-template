class LoginViewModelFactory {
    private let viewModel: LoginViewModel
    private let navigator: LoginNavigator
    private let repository: LoginRepository

    init(navigator: LoginNavigator) {
        self.navigator = navigator
        self.repository = LoginRepository()
        self.viewModel = LoginViewModel(loginRepo: repository, navigator: navigator)
    }

    func create() -> LoginViewModel {
        return viewModel
    }
}
