//
//  AppCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController! { get }

    func start()
    func coordinate(to coordinator: Coordinator)
}
extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}

final class AppCoordinator: Coordinator {

    private let window: UIWindow
    internal var navigationController: UINavigationController!

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }

    func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        coordinate(to: TabBarCoordinator(navigationController: navigationController))
    }
}
