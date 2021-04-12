//
//  FavoriteRepositoryTests.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import Foundation

import XCTest
@testable import TVShowsAPP

class FavoriteRepositoryTests: XCTestCase, TestableRepository {
    typealias GenericDAO = TVShowDAO
    var sut: FavoriteListRepository!
    typealias GenericRepository = FavoriteListRepository

    override func setUp() {
        self.sut = FavoriteListRepository()
    }

    override func tearDown() {
        self.clean()
    }

    func test_getAll_tvShows() {
        // when
        let allFavoritesTvShows = sut.getAll()
        // then
        XCTAssertEqual(allFavoritesTvShows, sut.favorites)
    }

    func test_getInexistent_repositoryGetResultNil() {
        // given
        let tvShow = TVShow(id: 2030, name: "Under the done")
        // when
        let result = sut.get(object: tvShow)
        // then
        XCTAssertNil(result)
    }

    func test_addFavorite_repositoryFavoriteNotNil() {
        // given
        let tvShow = TVShow(id: 999, name: "Under the done")
        // when
        let result = sut.add(object: tvShow)
        // then
        XCTAssertNotNil(result)
    }

    func test_deleteFavorite_repositoryCount0() {
        // given
        let tvShow = TVShow(id: 999, name: "Under the done2")
        let objectAdded = sut.add(object: tvShow)
        // when
        let result = sut.delete(object: tvShow)
        // then
        XCTAssertEqual(result?.id, objectAdded?.id)
    }

    func test_deleteInexistent_repositoryNil() {
        // given
        let tvShow = TVShow(id: 999, name: "Under the done")
        // when
        let result = sut.delete(object: tvShow)
        // then
        XCTAssertNil(result)
    }

}
