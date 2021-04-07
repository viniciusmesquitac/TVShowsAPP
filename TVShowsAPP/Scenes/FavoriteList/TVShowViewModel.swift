//
//  TVShowViewModel.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import Foundation

struct TVShowViewModel {

    let tvShow: TVShowDAO

    init(_ tvShow: TVShowDAO) {
        self.tvShow = tvShow
    }

    var name: String? {
        tvShow.name
    }

    var imageBackground: String? {
        tvShow.image?.background
    }

    func parseTvShow() -> TVShow {
        let genres = tvShow.genres?.components(separatedBy: " ,")
        let days = tvShow.schedule?.days?.components(separatedBy: " ,")
        let schedule = Schedule(time: tvShow.schedule?.time ?? "", days: days ?? [])
        let image = Image(medium: tvShow.image?.medium ?? "", background: tvShow.image?.background)
        let rating = Rating(average: tvShow.rating?.avarege)
        return TVShow(id: Int(tvShow.id), name: tvShow.name ?? "",
                      summary: tvShow.summary, url: tvShow.url ?? "",
                      type: tvShow.type ?? "", genres: genres ?? [],
                      officialSite: tvShow.officialSite,
                      schedule: schedule,
                      image: image, rating: rating)
    }
}
