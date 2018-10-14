class LoginViewModelFactory {
    static func create(with loginNavigator: LoginNavigator) -> LoginViewModel {
        return LoginViewModel(loginRepository: LoginRepository(), loginNavigator: loginNavigator)
    }
}
