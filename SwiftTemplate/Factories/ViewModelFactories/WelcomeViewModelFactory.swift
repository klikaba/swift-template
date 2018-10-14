class WelcomeViewModelFactory {
    static func create(with welcomeNavigator: WelcomeNavigator) -> WelcomeViewModel {
        return WelcomeViewModel(welcomeNavigator: welcomeNavigator)
    }
}
