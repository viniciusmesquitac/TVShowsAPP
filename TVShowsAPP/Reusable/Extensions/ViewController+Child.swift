//
//  ViewController+Child.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 02/04/21.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
