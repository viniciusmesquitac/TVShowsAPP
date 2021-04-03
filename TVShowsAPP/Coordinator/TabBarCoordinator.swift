//
//  TabBarCoordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    var coordinator: Coordinator?
    var currentIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    // Scrolls to top
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if currentIndex == 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            let navigationController = viewController as? UINavigationController
            let showsListViewController = navigationController?.viewControllers.first as? ShowsListViewController
            showsListViewController?.mainView
                .showsListCollectionView
                .scrollToItem(at: indexPath, at: .top, animated: true)
        }
        let tabBarIndex = tabBarController.selectedIndex
        currentIndex = tabBarIndex
    }
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
        // 2 Criar Navigations
        let showListNavigation = UINavigationController()
        showListNavigation.tabBarItem = UITabBarItem(
            title: "Home", image: Stylesheet.Icons.home,
            selectedImage: Stylesheet.Icons.home)

        let searchListNavigation = UINavigationController()
        searchListNavigation.tabBarItem = UITabBarItem(
            title: "Search", image: Stylesheet.Icons.search,
            selectedImage: Stylesheet.Icons.search)

        let favoritesListNavigation = UINavigationController()
        favoritesListNavigation.tabBarItem = UITabBarItem(
            title: "Favorites", image: Stylesheet.Icons.favorites,
            selectedImage: Stylesheet.Icons.favorites)

        // 3. Criar Coordinators
        let coordinators: [Coordinator] = [
            ShowsListCoordinator(navigationController: showListNavigation),
            SearchListCoordinator(navigationController: searchListNavigation),
            FavoriteListCoordinator(navigationController: favoritesListNavigation)
        ]
        // 4. Inserir as tabs na controller
        let navigations = coordinators.map { $0.navigationController! }
        tabBarController.viewControllers = navigations
        tabBarController.modalPresentationStyle = .fullScreen
        // 5. Apresentar a controller
        navigationController.present(tabBarController, animated: false, completion: nil)
        // 6. Referencias as coordendadas.
        for coordinator in coordinators {
            coordinate(to: coordinator)
        }
    }

}
