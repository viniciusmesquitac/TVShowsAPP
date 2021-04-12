//
//  AlertMessage.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 09/04/21.
//

import UIKit

protocol AlertMessage {
    func alert(with message: String, target: UINavigationController, handler: ((UIAlertAction) -> Void)?)
}

extension AlertMessage {
    func alert(with message: String, target: UINavigationController, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Finish", style: .default, handler: handler))
        target.present(alertController, animated: true)
    }
}
