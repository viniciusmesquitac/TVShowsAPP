//
//  ShowsListCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

final class ShowsListCoordinator: Coordinator {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController?) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
        self.navigationController.navigationBar.tintColor = Stylesheet.Color.primaryColor
    }

    func start() {
        let showsListViewController = ShowsListViewController()
        navigationController.pushViewController(showsListViewController, animated: false)
    }

    func details(tvShow: TVShow) {
        let tvShowListCoordinator = TVShowDetailsCoordinator(
            navigationController: navigationController, tvShow: tvShow)
        tvShowListCoordinator.start()
    }

}
