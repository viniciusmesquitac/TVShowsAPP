//
//  Episodes.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 01/04/21.
//

import Foundation
// swiftlint:disable identifier_name
struct Episode: Codable {
    var id: Int
    var url: String
    var name: String
    var season: Int
    var number: Int
    var type: String
    var image: Image?
    var summary: String
}
