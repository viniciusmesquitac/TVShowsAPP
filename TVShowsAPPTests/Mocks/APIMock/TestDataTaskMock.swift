//
//  TestDataTaskMock.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import Foundation
@testable import TVShowsAPP

class TestDataTaskDataMock {
    var testData: Data?
    var testError: Error?
    var testResponse: URLResponse?

    init(data: Data?, error: Error?, response: URLResponse?) {
        self.testError = error
        self.testData = data
        self.testResponse = response
    }
}
