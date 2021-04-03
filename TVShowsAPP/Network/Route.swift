//
//  Route.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import Foundation

protocol Router {
    var hostname: String { get }
    var url: URL? { get }
}

enum TVMazeRouter: Router {
    case shows(page: Int)
    case allEpisodes(show: Int)
    case search(query: String)
    case images(show: Int)

    var hostname: String {
        return "http://api.tvmaze.com"
    }

    var url: URL? {
        switch self {
        case .shows(page: let page):
            return URL(string: "\(hostname)/shows?page=\(page)&embed=images")
        case .allEpisodes(show: let idShow):
            return URL(string: "\(hostname)/shows/\(idShow)/episodes")
        case .search(query: let query):
            return URL(string: "\(hostname)/search/shows?q=:\(query)")
        case .images(show: let showId):
            return URL(string: "\(hostname)/shows/\(showId)/images")
        }
    }
}
