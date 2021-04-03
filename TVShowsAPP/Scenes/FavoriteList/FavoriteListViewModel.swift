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

struct TVShowViewModel {

    let tvShow: TVShowDAO

    init(_ tvShow: TVShowDAO) {
        self.tvShow = tvShow
    }

    var name: String? {
        tvShow.name
    }

    func parseTvShow() -> TVShow {
        let genres = tvShow.genres?.components(separatedBy: " ,")
        let days = tvShow.schedule?.days?.components(separatedBy: " ,")
        let schedule = Schedule(time: tvShow.schedule?.time ?? "", days: days ?? [])
        let image = Image(medium: tvShow.image?.medium ?? "")
        let rating = Rating(average: tvShow.rating?.avarege)
        return TVShow(id: Int(tvShow.id), name: tvShow.name ?? "",
                      summary: tvShow.summary, url: tvShow.url ?? "",
                      type: tvShow.type ?? "", genres: genres ?? [],
                      officialSite: tvShow.officialSite,
                      schedule: schedule,
                      image: image, rating: rating)
    }
}
