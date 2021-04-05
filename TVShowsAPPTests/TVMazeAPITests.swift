//
//  TVMazeAPITests.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import XCTest
@testable import TVShowsAPP

class TVMazeAPITests: XCTestCase {
    
    let session = URLSessionMock()
    
    func test_nasaApiCall_urlForEarthImages_toBeValid() {
          //Given
          let sut = ApiModel(session: session)
          let url = URL(string: "https://images-api.nasa.gov/search?q=earth&media_type=image")

          let expect = expectation(description: "nasaApi")

          //When
          sut.nasaApiCall(celestialBodyNames: "Terra", indexImage: 1) { _ in
              //Then
              XCTAssertEqual(url, self.session.lastUrl)
              expect.fulfill()
          }

          wait(for: [expect], timeout: 5)
      }
    
}
