//
//  TVMazeAPI.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 31/03/21.
//

import Foundation

class TVMazeAPI {

    func shows(at page: Int, completion: @escaping ([TVShow]?) -> Void) {
        let url = TVMazeRouter.shows(page: page).url

        HTTP.get.request(url: url) { (data, response, error) in
            guard let data = data else { return }
            print(response!)

            do {
                let tvShows = try JSONDecoder().decode([TVShow].self, from: data)
                completion(tvShows)
            } catch {
                print(error)
            }
        }
    }
}
