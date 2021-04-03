//
//  TVShow.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import Foundation
// swiftlint:disable identifier_name
struct Rating: Decodable {
    var average: Float?
}

struct Network: Decodable {
    var id: Int
    var name: String
}

struct Image: Decodable {
    var medium: String
}

struct Schedule: Decodable {
    var time: String
    var days: [String]
}

struct TVShow: Decodable {
    var id: Int
    var name: String
    var summary: String?
    var url: String
    var type: String
    var genres: [String]
    var officialSite: String?
    var schedule: Schedule?
    var network: Network?
    var image: Image?
    var rating: Rating?
    var images: ImageResult?
}
