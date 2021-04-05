//
//  DownlaoadTaskMock.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import Foundation
@testable import TVShowsAPP

class DownloadTaskMock: URLSessionDownloadTask {
    var mockData: TestDownloadTaskDataMock?
    var calledResume = false
    var completion: (URL?, URLResponse?, Error?) -> Void

    init(mockData: TestDownloadTaskDataMock? = nil, completion: @escaping (URL?, URLResponse?, Error?) -> Void) {
        self.completion = completion
        self.mockData = mockData
    }

    override func resume() {
        calledResume = true
        completion(mockData?.testData, mockData?.testResponse, mockData?.testError)
    }
}

class TestDownloadTaskDataMock {
    var testData: URL?
    var testError: Error?
    var testResponse: URLResponse?

    init(data: URL?, error: Error?, response: URLResponse?) {
        self.testError = error
        self.testData = data
        self.testResponse = response
    }
}
