import XCTest

class userProfile: XCTestCase {
    var UUT: UserProfile!
    
    override func setUp() {
        super.setUp()
        UUT = UserProfile()
    }
    
    override func tearDown() {
        UUT.resetNumberOfDesiredMeals()
        UUT = nil
        super.tearDown()
    }
    
    func testProperSetUp() {
        XCTAssertNotNil(UUT, "The user profile was nill")
    }
    
    func testGetDefaultNumberOfDesiredMealsExpected0() {
        XCTAssertEqual(UUT.numberOfDesiredMeals, 0, "Default number of desired meals was not 0")
    }
}
