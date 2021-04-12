//
//  FavoriteListViewModelTests.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 06/04/21.
//
import XCTest
@testable import TVShowsAPP

class FavoriteListViewModelTests: XCTestCase, TestableRepository {
    typealias GenericRepository = FavoriteListRepository
    typealias GenericDAO = TVShowDAO
    var sut: GenericRepository!

    override func setUp() {
        sut = FavoriteListRepository()
    }

    // Mark - Clean Repository
    override func tearDown() {
        self.clean()
    }

    // Mark - Helpers
    func makeSut() -> FavoriteListViewModel {
        let viewModel = FavoriteListViewModel()
        return viewModel
    }

    func test_addFavorite_favorite() {
        let sut = makeSut()
        let tvShow = TVShow(id: 0, name: "Under the done")
        sut.addFavorite(tvShow)

        let repositorySut = self.sut.get(object: tvShow)
        XCTAssertEqual(tvShow.name, repositorySut?.name)
    }

}
