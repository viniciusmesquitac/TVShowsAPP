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

    func episodes(idShow: Int, completion: @escaping ([Episode]?) -> Void) {
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

}
