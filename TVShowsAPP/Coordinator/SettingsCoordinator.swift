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
        let settingsTableViewController = SettingsTableViewController(style: .grouped)
        navigationController.pushViewController(settingsTableViewController, animated: false)
    }

}
