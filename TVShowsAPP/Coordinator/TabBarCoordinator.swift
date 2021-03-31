//
//  TabBarCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class TabBarController: UITabBarController {
    var coordinator: Coordinator?
}

class TabBarCoordinator: Coordinator {

    var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        // 1. Instanciar a controller
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        // 2. Criar Coordinators
        let coordinators: [Coordinator] = [
            ShowsListCoordinator(navigationController: UINavigationController()),
            SearchListCoordinator(navigationController: UINavigationController())
        ]
        // 3. Inserir as tabs na controller
        let navigations = coordinators.map { $0.navigationController! }
        tabBarController.viewControllers = navigations
        tabBarController.modalPresentationStyle = .fullScreen
        // 4. Apresentar a controller
        navigationController.present(tabBarController, animated: false, completion: nil)
        // 5. Referencias as coordendadas.
        for coordinator in coordinators {
            coordinate(to: coordinator)
        }
    }

}
