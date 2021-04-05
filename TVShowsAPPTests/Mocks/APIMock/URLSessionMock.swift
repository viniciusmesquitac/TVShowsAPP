//
//  URLSessionMock.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 05/04/21.
//
import Foundation
@testable import TVShowsAPP

class URLSessionMock: URLSession {
    var lastUrl: URL?
    var dataTask: DataTaskMock?
    var dowlondTask: DownloadTaskMock?
    var testDataTaskData: Data?
    var testURLData: URL?
    var testError: Error?
    var testResponse: HTTPURLResponse?

    override func dataTask(with request: URL,
                           completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastUrl = request
        let testMock = TestDataTaskDataMock(data: testDataTaskData, error: testError, response: testResponse)
        dataTask = DataTaskMock(mockData: testMock, completion: completionHandler)
        return dataTask!
    }

    override func downloadTask(with url: URL,
                               completionHandler: @escaping
                                (URL?, URLResponse?, Error?) -> Void) -> URLSessionDownloadTask {
        lastUrl = url
        let testMock = TestDownloadTaskDataMock(data: testURLData, error: testError, response: testResponse)
        dowlondTask = DownloadTaskMock(mockData: testMock, completion: completionHandler)
        return dowlondTask!
    }

}
