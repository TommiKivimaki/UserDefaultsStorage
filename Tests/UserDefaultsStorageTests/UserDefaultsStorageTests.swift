import XCTest
import Combine
@testable import UserDefaultsStorage

final class UserDefaultsStorageTests: XCTestCase {
    
    @UserDefaultsStorage<String>(key: "myName", defaultValue: "") var myName
    @UserDefaultsStorage<Int?>(key: "age") var age: Int?
    @UserDefaultsStorage(key: UserDefaultsKey.testKey, defaultValue: "Initial value") var testKey

    private let userDefaultsController = UserDefaultsPublished()
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

    func testUserDefaultsKey() {
        XCTAssertEqual(testKey, "Initial value")
        testKey = "Updated value"
        XCTAssertEqual(testKey, "Updated value")
    }
    
    static var allTests = [
        ("testNonOptionalValue", testNonOptionalValue),
        ("testOptionalValue", testOptionalValue)
    ]
}
