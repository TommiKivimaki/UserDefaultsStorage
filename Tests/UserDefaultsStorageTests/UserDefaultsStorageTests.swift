import XCTest
@testable import UserDefaultsStorage

final class UserDefaultsStorageTests: XCTestCase {
    
    @UserDefaultsStorage<String>(key: "myName", defaultValue: "") var myName
    @UserDefaultsStorage<Int?>(key: "age") var age: Int?
    
    
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
    
    static var allTests = [
        ("testNonOptionalValue", testNonOptionalValue),
        ("testOptionalValue", testOptionalValue)
    ]
}
