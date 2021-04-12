//
//  KeychainService.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 09/04/21.
//

import Security
import Foundation

enum KeychainError: Error {
    case failed
}

enum SecretKey: String {
    case pin
}

class KeychainService {
    func save(secretKey: SecretKey, value: String) throws {
        let query = [
                    kSecClass as String: kSecClassGenericPassword as String,
                    kSecAttrAccount as String: secretKey.rawValue,
                    kSecValueData as String: value.data(using: .utf8) ?? Data()
                ] as [String: Any]
        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { throw KeychainError.failed }
    }

    func retrive(secretKey: SecretKey) throws -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: secretKey.rawValue,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
          ]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status != errSecItemNotFound else {
            throw KeychainError.failed
        }
        guard status == errSecSuccess else {
            throw KeychainError.failed
        }

        guard
          let existingItem = item as? [String: Any],
          let valueData = existingItem[kSecValueData as String] as? Data,
          let value = String(data: valueData, encoding: .utf8)
          else {
            throw KeychainError.failed
        }
        return value
    }
}
