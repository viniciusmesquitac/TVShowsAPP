//
//  PredicateEnum.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import Foundation
// swiftlint:disable identifier_name
enum Predicate {

    case id(_ identifier: String)

    var predicate: NSPredicate {

        switch self {

        case .id(let identifier):
            return NSPredicate(format: "id = %@", identifier)
        }
    }
}
