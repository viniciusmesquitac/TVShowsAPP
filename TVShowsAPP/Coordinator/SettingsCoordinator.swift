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
        self.navigationController.navigationBar.tintColor = Stylesheet.Color.primaryColor
        self.navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    }

    func start() {
    }

}
