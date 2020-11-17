import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(UserDefaultsStorageTests.allTests),
        testCase(UserDefaultsPublishedTests.allTests),
    ]
}
#endif
