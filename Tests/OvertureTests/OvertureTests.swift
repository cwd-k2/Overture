import XCTest
@testable import Overture

final class OvertureTests: XCTestCase {
  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    XCTAssertEqual(Overture().text, "Hello, World!")
  }

  func operatorTest() {
    let a = {$0 + 90} <| 4 * 4
    XCTAssertEqual(a, 106)
    let b = 5 + 84 |> {$0 * 9} |> {$0 / 3}
    XCTAssertEqual(b, 267)
  }

  func functorTest() {
    let c: (Int) -> (Int) -> (Int) -> Int = %{
      $0 / $1 - $2
    }
    XCTAssertEqual(c(2)(2)(1), 0)
    let a = { $0 + 2 } <%> [1, 2, 4]
    XCTAssertEqual(a, [3, 5, 6])
    let b = { $0 * 5 } <%> a
    XCTAssertEqual(b, [15, 25, 30])
  }

  static var allTests = [
    ("operatorTest", operatorTest),
    ("functorTest", functorTest),
  ]
}
