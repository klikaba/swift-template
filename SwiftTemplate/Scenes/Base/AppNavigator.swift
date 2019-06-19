import UIKit

protocol AppNavigatorProtocol {
    func goToWelcome()
    func goToHome()
    func goToLogin()
}

class AppNavigator: AppNavigatorProtocol {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func goToWelcome() {
        let welcomeViewController = WelcomeViewController.instantiateFromAppStoryboard(appStoryboard:
                                                                                       .welcome)
        let welcomeNavigator = WelcomeNavigator(navigationController: navigationController)
        welcomeViewController.viewModel = WelcomeViewModel(welcomeNavigator: welcomeNavigator)
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(welcomeViewController, animated: true)
    }

    func goToHome() {
        let tabBarController = UITabBarController()
        let countriesViewController = CountriesViewController.instantiateFromAppStoryboard(appStoryboard:
                                                                                           .home)
        countriesViewController.viewModel = CountriesViewModelFactory.create()
        countriesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        let userViewController = UserViewController.instantiateFromAppStoryboard(appStoryboard: .home)
        userViewController.viewModel = UserViewModel()

        userViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        tabBarController.viewControllers = [countriesViewController, userViewController]
        // Until we implement logout and sidemenu
        navigationController.pushViewController(tabBarController, animated: true)
    }

    func goToLogin() {
        let loginViewController = LoginViewController.instantiateFromAppStoryboard(appStoryboard: .login)
        let loginNavigator = LoginNavigator(navigationController: navigationController)
        loginViewController.viewModel = LoginViewModelFactory.create(with: loginNavigator)
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(loginViewController, animated: true)
    }

}
