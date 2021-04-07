//
//  FavoriteListViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import Foundation

class FavoriteListViewModel {

    var handleUpdate: (() -> Void)?
    let repository = FavoriteListRepository()
    var favorites: [TVShowViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.handleUpdate?()
            }
        }
    }

    var numberOfRows: Int {
        return favorites.count
    }

    func getAllFavorites() {
        let favorites = repository.getAll()
        self.favorites = favorites.compactMap(TVShowViewModel.init)
    }

    func addFavorite(_ favorite: TVShow) {
        repository.add(object: favorite)
    }

    func deleteFavorite(_ favorite: TVShow) {
        repository.delete(object: favorite)
    }
}
