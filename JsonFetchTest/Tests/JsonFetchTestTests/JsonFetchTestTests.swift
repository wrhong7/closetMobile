import XCTest
@testable import JsonFetchTest

class JsonFetchTestTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(JsonFetchTest().text, "Hello, World!")
    }


    static var allTests : [(String, (JsonFetchTestTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
