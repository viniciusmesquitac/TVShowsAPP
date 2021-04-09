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
        if UserDefaults.standard.bool(forKey: UserDefaultsEnum.isPinAuthOn.rawValue) {
            pinCodeSetConfig()
        } else {
            pinCodeConfigDetails()
        }
    }

    func pinCodeSetConfig() {
        let pinConfigViewController = PinConfigViewController()
        let navigation = UINavigationController(rootViewController: pinConfigViewController)
        pinConfigViewController.coordinator = self
        navigation.navigationBar.barTintColor = Stylesheet.Color.backgroundColor
        navigation.modalPresentationStyle = .overFullScreen
        navigationController.present(navigation, animated: true)
    }

    func pinCodeConfigDetails() {
        let pinConfigViewController = SettingsTableViewController(viewModel: PinConfigViewModel(coordinator: self))
        navigationController.pushViewController(pinConfigViewController, animated: true)
    }

}
