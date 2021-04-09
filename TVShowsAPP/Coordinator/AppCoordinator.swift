//
//  AppCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

final class AppCoordinator: Coordinator, AlertMessage {
    private let window: UIWindow
    internal var navigationController: UINavigationController!

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.navigationController.navigationBar.tintColor = Stylesheet.Color.primaryColor
    }

    func start() {
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
        if UserDefaults.standard.bool(forKey: UserDefaultsEnum.isBiometricOn.rawValue) {
            BiometricAuthentication().identify { success, _ in
                if success {
                    self.coordinate(to: TabBarCoordinator(navigationController: self.navigationController))
                } else {
                    self.alert(with: "Something got wrong...", target: self.navigationController) { _ in
                        exit(EXIT_SUCCESS)
                    }
                }
            }
        } else {
            coordinate(to: TabBarCoordinator(navigationController: navigationController))
        }
    }
}
