//
//  TVMazeAPI.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import Foundation

class TVMazeAPI {
    public var isPaginating = false

    func shows(pagination: Bool, at page: Int, completion: @escaping ([TVShow]?) -> Void) {
        let url = TVMazeRouter.shows(page: page).url
        if pagination {
            isPaginating = true
        }
        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let tvShows = try JSONDecoder().decode([TVShow].self, from: data)
                completion(tvShows)
                if pagination {
                    self.isPaginating = false
                }
            } catch {
                print(error)
            }
        }
    }

    func allEpisodes(idShow: Int, completion: @escaping ([Episode]?) -> Void) {
        let url = TVMazeRouter.allEpisodes(show: idShow).url

        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let episodes = try JSONDecoder().decode([Episode].self, from: data)
                completion(episodes)
            } catch {
                print(error)
            }
        }
    }

    func episodes(seasonId: Int, completion: @escaping ([Episode]?) -> Void) {
        let url = TVMazeRouter.episodes(season: seasonId).url

        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let episodes = try JSONDecoder().decode([Episode].self, from: data)
                completion(episodes)
            } catch {
                print(error)
            }
        }
    }

    func seasons(idShow: Int, completion: @escaping ([Season]?) -> Void) {
        let url = TVMazeRouter.seasons(show: idShow).url

        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let seasons = try JSONDecoder().decode([Season].self, from: data)
                completion(seasons)
            } catch {
                print(error)
            }
        }
    }

    func search(query: String, completion: @escaping ([SearchResult]?) -> Void) {
        let url = TVMazeRouter.search(query: query).url

        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let searchResult = try JSONDecoder().decode([SearchResult].self, from: data)
                completion(searchResult)
            } catch {
                print(error)
            }
        }
    }

    func image(idShow: Int, completion: @escaping ([ImageResult]?) -> Void) {
        let url = TVMazeRouter.images(show: idShow).url

        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let imageResult = try JSONDecoder().decode([ImageResult].self, from: data)
                completion(imageResult)
            } catch {
                print(error)
            }
        }
    }

    func recentShows(completion: @escaping (Set<TVShow>) -> Void) {
        let url = TVMazeRouter.schedule.url

        HTTP.get.request(url: url) { (data, _, error) in
            guard let data = data else { return }

            do {
                let episodeResult = try JSONDecoder().decode([Episode].self, from: data)
                let newSeasons = episodeResult.filter { $0.season == 1 }
                let newSeasonsFiltered = newSeasons.filter { $0.show != nil && $0.show?.image != nil }
                let shows = newSeasonsFiltered.map { $0.show! }
                completion(Set(shows))
            } catch {
                print(error)
            }
        }
    }

}
