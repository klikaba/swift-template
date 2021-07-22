class RegistrationViewModelFactory {
    static func create(with registrationNavigator: RegistrationNavigator) -> RegistrationViewModel {
        let userRepository = UserRepositoryFactory.create()
        return RegistrationViewModel(
            userRepository: userRepository,
            registrationNavigator: registrationNavigator
        )
    }
}
