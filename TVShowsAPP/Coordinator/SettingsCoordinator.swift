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
        print("Go to pin code config")
    }

}
