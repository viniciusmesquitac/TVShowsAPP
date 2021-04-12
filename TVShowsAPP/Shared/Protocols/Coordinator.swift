//
//  Coordinator.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 09/04/21.
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
