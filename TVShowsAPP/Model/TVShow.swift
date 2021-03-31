//
//  TVShow.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import Foundation
// swiftlint:disable identifier_name
struct Rating: Codable {
    var avarage: Float
}

struct Network: Codable {
    var id: String
    var name: String
}

struct Image: Codable {
    var medium: String
}

struct Schedule: Codable {
    var time: String
    var days: [String]
}

struct TVShow: Codable {
    var id: Int
    var name: String
    var sumary: String
    var url: String
    var type: String
    var genres: [String]
    var oficialSite: String
    var schedule: Schedule
    var network: Network
    var image: Image
    var rating: Rating
}
