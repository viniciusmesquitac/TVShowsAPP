//
//  FavoriteListCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

final class FavoriteListCoordinator: Coordinator {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController?) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
        self.navigationController.navigationBar.tintColor = Stylesheet.Color.primaryColor
    }

    func start() {
        let favoriteListViewController = FavoriteListViewController()
        navigationController.pushViewController(favoriteListViewController, animated: false)
    }

}
