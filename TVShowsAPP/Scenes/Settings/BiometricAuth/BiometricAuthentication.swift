//
//  PINCodeViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 07/04/21.
//

import UIKit
import LocalAuthentication

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

class BiometricAuthentication {
    let reason = "Identify yourself!"
    func identify(completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticationError) in
                DispatchQueue.main.async {
                    completion(success, authenticationError)
                }
            }
        } else {
            completion(false, error)
        }

    }
}
