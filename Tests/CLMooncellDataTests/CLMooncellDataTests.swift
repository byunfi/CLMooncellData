import XCTest
@testable import CLMooncellData

final class CLMooncellDataTests: XCTestCase {
    
    func testHomeData() {
        let expectation = XCTestExpectation(description: "homeSourceData arrived")
        let md = CLMooncellData()
        md.homeData { data in
            XCTAssertNotNil(data.value)
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 10)
    }

    static var allTests = [
        ("testHomeData", testHomeData),
    ]
}
