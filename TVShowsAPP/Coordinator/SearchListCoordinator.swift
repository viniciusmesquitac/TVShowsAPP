//
//  SearchListCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

final class SearchListCoordinator: Coordinator {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController?) {
        guard let navigation = navigationController else { fatalError() }
        self.navigationController = navigation
    }

    func start() {
        let searchListViewController = SearchListViewController()
        navigationController.pushViewController(searchListViewController, animated: false)
    }

}
