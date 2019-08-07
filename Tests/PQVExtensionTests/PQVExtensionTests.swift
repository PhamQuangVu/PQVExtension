import XCTest
@testable import PQVExtension

final class PQVExtensionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PQVExtension().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
