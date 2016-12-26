//
//  userProfile.swift
//  fit360
//
//  Created by Anders Opstrup on 26/12/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import XCTest

class userProfile: XCTestCase {
    var UUT: UserProfile!
    
    override func setUp() {
        super.setUp()
        UUT = UserProfile()
    }
    
    override func tearDown() {
        UUT = nil
        super.tearDown()
    }
    
    func testProperSetUp() {
        XCTAssertNotNil(UUT, "The user profile was nill")
    }
}
