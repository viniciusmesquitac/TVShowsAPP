//
//  PINCodeViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 07/04/21.
//

import UIKit
import LocalAuthentication

class BiometricAuthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        identify()
    }

    func identify() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] (success, authenticationError) in
                DispatchQueue.main.async {
                    if success {
                    } else {
                        self?.createAlert(with: "You couldn't be autheticated")
                    }
                }
            }

        } else {
            self.createAlert(with: "Biometric not available")
        }

    }

    func createAlert(with message: String) {
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ac, animated: true)
    }
}
