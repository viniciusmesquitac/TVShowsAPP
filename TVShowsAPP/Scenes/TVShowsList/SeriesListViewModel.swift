//
//  ShowsListViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import Foundation

class ShowListViewModel {

    var handleUpdate: (() -> Void)?
    var currentPage = 1

    var tvShows: [TVShow] = [] {
        didSet {
            DispatchQueue.main.async { self.handleUpdate?() }
        }
    }

    public func getTvShow(at index: Int) -> TVShow? {
        if tvShows.count >= index {
            let show = tvShows[index]
            return show
        }
        return nil
    }

    public var numberOfRows: Int {
        return tvShows.count
    }

    public func getListOfShows(page: Int) {
        TVMazeAPI().shows(at: 1) { tvShows in
            guard let tvShowFromApi = tvShows else { return }
            self.tvShows += tvShowFromApi
        }
    }
}
