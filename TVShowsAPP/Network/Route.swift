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

    var hostname: String {
        return "http://api.tvmaze.com"
    }

    var url: URL? {
        switch self {
        case .shows(page: let page):
            return URL(string: "\(hostname)/shows?page=\(page)")
        }
    }
}
