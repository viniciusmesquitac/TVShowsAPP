//
//  SettingsCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

final class SettingsListCoordinator: Coordinator {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController?) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
    }

    func start() {
        let settingsTableViewController = SettingsTableViewController(viewModel: SettingsViewModel(coordinator: self))
        navigationController.pushViewController(settingsTableViewController, animated: false)
    }

    func pinCodeConfig() {
        let pinConfigViewController = PinConfigViewController()
        let navigation = UINavigationController(rootViewController: pinConfigViewController)
        navigation.navigationBar.barTintColor = .systemBackground
        navigation.modalPresentationStyle = .overFullScreen
        navigationController.present(navigation, animated: true)
    }

    func biometricAuth() {
        let biometricAuthViewController = BiometricAuthViewController()
        navigationController.pushViewController(biometricAuthViewController, animated: true)
    }

}
