import XCTest
import Combine
@testable import UserDefaultsStorage

final class UserDefaultsStorageTests: XCTestCase {
    
    @UserDefaultsStorage<String>(key: "myName", defaultValue: "") var myName
    @UserDefaultsStorage<Int?>(key: "age") var age: Int?

    private let userDefaultsController = UserDefaultsController()
    private var subscriptions = Set<AnyCancellable>()

    override class func setUp() {}
    
    override class func tearDown() {}
    
    func testNonOptionalValue() {

        XCTAssertEqual(myName, "")
        
        myName = "Tommi"
        XCTAssertEqual(myName, "Tommi")
        
        myName = ""
        XCTAssertEqual(myName, "")
    }

    func testOptionalValue() {
        XCTAssertNil(age)
        
        age = 40
        XCTAssertEqual(age, 40)
        
        age = nil
        XCTAssertNil(age)
    }

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
        ("testNonOptionalValue", testNonOptionalValue),
        ("testOptionalValue", testOptionalValue),
        ("testPublishingValuesViaCombine", testPublishingValuesViaCombine)
    ]
}
