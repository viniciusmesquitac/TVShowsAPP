//
//  TVShowViewModelTests.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 06/04/21.
//

import XCTest
@testable import TVShowsAPP

class TVShowViewModelTests: XCTestCase {

    // Mark - Helpers
    func makeSut(with tvShow: TVShow) -> TVShowViewModel {
        let service = CoreDataService<TVShowDAO>()
        let tvShowDao = service.new()!
        tvShowDao.name = tvShow.name
        tvShowDao.id = Int32(tvShow.id)
        let viewModel = TVShowViewModel(tvShowDao)
        return viewModel
    }

    func makeSut() -> TVShowViewModel {
        let service = CoreDataService<TVShowDAO>()
        let tvShowDao = service.new()!
        let viewModel = TVShowViewModel(tvShowDao)
        return viewModel
    }

    func test_parseToTvShow_tvShow() {
        let sut = makeSut(with: TVShow(id: 0, name: "Under the done"))
        let result = sut.parseTvShow()
        XCTAssertEqual(result.name, sut.name)
    }

    func test_NotNilName_tvShow() {
        let sut = makeSut()
        let result = sut.parseTvShow()
        XCTAssertNotNil(result.name)
    }

    func test_backgroundImageNil_tvShow() {
        let sut = makeSut()
        let result = sut.imageBackground
        XCTAssertNil(result)
    }

    func test_backgroundImageNotNil_tvShow() {
        let tvshow = TVShow(
            id: 0, name: "Under", image: Image(medium: "invalid", background: "www.tvmaze/images/1"))
        let sut = makeSut(with: tvshow)
        let result = sut.imageBackground
        XCTAssertNil(result)
    }

}
