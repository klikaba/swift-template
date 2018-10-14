class WelcomeViewModelFactory {
    private let viewModel: WelcomeViewModel
    private let navigator: WelcomeNavigator

    init(navigator: WelcomeNavigator) {
        self.navigator = navigator
        self.viewModel = WelcomeViewModel(navigator: navigator)
    }

    func create() -> WelcomeViewModel {
        return viewModel
    }
}
