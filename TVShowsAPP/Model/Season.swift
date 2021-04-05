//
//  Season.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import Foundation

struct Season: Decodable {
    let id: Int
    let url: String?
    let number: Int?
    let episodeOrder: Int?
    let premiereDate: String?
    let network: Network?
}

/*
 {
    "id":1,
    "url":"https://www.tvmaze.com/seasons/1/under-the-dome-season-1",
    "number":1,
    "name":"",
    "episodeOrder":13,
    "premiereDate":"2013-06-24",
    "endDate":"2013-09-16",
    "network":{
       "id":2,
       "name":"CBS",
       "country":{
          "name":"United States",
          "code":"US",
          "timezone":"America/New_York"
       }
    },
    "webChannel":null,
    "image":{
       "medium":"https://static.tvmaze.com/uploads/images/medium_portrait/24/60941.jpg",
       "original":"https://static.tvmaze.com/uploads/images/original_untouched/24/60941.jpg"
    },
    "summary":"",
    "_links":{
       "self":{
          "href":"https://api.tvmaze.com/seasons/1"
       }
    }
 },
 */
