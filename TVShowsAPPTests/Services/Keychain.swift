//
//  Keychain.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 09/04/21.
//

import XCTest
@testable import TVShowsAPP

class KeychainServiceTests: XCTestCase {

    func test1_save_success() {
        let sut = KeychainService()
        XCTAssertNoThrow(try sut.save(secretKey: .pin, value: "123456"))
    }

    func test2_retrive_success() {
        let sut = KeychainService()
        let result = try? sut.retrive(secretKey: .pin)
        XCTAssertEqual(result, "123456")
    }
}
