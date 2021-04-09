//
//  SearchListViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 02/04/21.
//

import Foundation

class SearchListViewModel {

    var resultTvShowList: [SearchResult]?
    var recentShows: [TVShow]?
    var didFinishSearch: (() -> Void)?
    var didFinishRecentSearch: (() -> Void)?
    let tvMaze = TVMazeAPI()

    var tvShows: [TVShow]? {
        return resultTvShowList?.compactMap { $0.show }
    }

    func search(with query: String) {
        tvMaze.search(query: query) { result in
            self.resultTvShowList = result
            self.didFinishSearch?()
        }
    }

    func getRecentShows() {
        tvMaze.recentShows { result in
            self.recentShows = Array(result)
            self.didFinishRecentSearch?()
        }
    }
}
