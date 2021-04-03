//
//  ImagesResult.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import Foundation

struct Resolutions: Decodable {
    let original: Original?
    let medium: Medium?
}

struct Original: Decodable {
    let url: String
}

struct Medium: Decodable {
    let url: String
}

struct ImageResult: Decodable {
    let id: Int
    let type: String
    let main: Bool
    let resolutions: Resolutions
}
