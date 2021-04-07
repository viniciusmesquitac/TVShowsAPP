//
//  DataTaskMock.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 05/04/21.
//

import Foundation
@testable import TVShowsAPP

class DataTaskMock: URLSessionDataTask {
    var mockData: TestDataTaskDataMock?
    var calledResume = false
    var completion: (Data?, URLResponse?, Error?) -> Void

    init(mockData: TestDataTaskDataMock? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.completion = completion
        self.mockData = mockData
    }
    override func resume() {
        calledResume = true
        self.completion(mockData?.testData, mockData?.testResponse, mockData?.testError)
    }
}
