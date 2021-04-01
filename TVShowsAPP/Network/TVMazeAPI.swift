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
        HTTP.get.request(url: url) { (data, response, error) in
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
}
