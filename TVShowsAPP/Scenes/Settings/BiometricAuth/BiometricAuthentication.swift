//
//  PINCodeViewController.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 07/04/21.
//

import UIKit
import LocalAuthentication

enum BiometricType {
    case faceID
    case touchID
}

class BiometricAuthentication {
    let reason = "Identify yourself!"
    let context = LAContext()

    var type: BiometricType {
        context.biometryType == .faceID ?  .faceID: .touchID
    }

    func identify(completion: @escaping (Bool, Error?) -> Void) {
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
