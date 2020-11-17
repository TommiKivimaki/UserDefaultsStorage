// Copyright © 17.11.2020 Tommi Kivimäki.

import XCTest
import Combine
@testable import UserDefaultsStorage

final class UserDefaultsPublishedTests: XCTestCase {

    private let userDefaultsController = UserDefaultsPublished()
    private var subscriptions = Set<AnyCancellable>()

    override class func setUp() {}

    override class func tearDown() {}

    func testPublishingValuesViaCombine() {
        // Test by setting a value
        userDefaultsController.isTest = true
        XCTAssertTrue(userDefaultsController.isTest)

        // Test by setting a value and subscribing to a publisher
        let expectation = XCTestExpectation(description: "isTestPublisher")
        userDefaultsController.isTestPublisher
            .sink {
                XCTAssertFalse($0)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        userDefaultsController.isTest = false

        wait(for: [expectation], timeout: 1)
    }

    func testPublishingOptionalValuesViaCombine() {
        // Test by setting a value
        userDefaultsController.optionalTest = 1
        XCTAssertEqual(userDefaultsController.optionalTest, 1)

        // Test by setting a value and subscribing to a publisher
        let expectation = XCTestExpectation(description: "optionalTest")
        userDefaultsController.optionalTestPublisher
            .sink {
                XCTAssertNil($0)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        userDefaultsController.optionalTest = nil

        wait(for: [expectation], timeout: 1)
    }

    static var allTests = [
        ("testPublishingValuesViaCombine", testPublishingValuesViaCombine),
        ("testPublishingOptionalValuesViaCombine", testPublishingOptionalValuesViaCombine)
    ]
}
