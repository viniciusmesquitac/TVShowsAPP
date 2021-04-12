//
//  Season.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import Foundation
// swiftlint:disable identifier_name
struct Season: Decodable {
    let id: Int
    let url: String?
    let number: Int?
    let episodeOrder: Int?
    let premiereDate: String?
    let network: Network?
}
