//
//  mealTests.swift
//  fit360
//
//  Created by Anders Opstrup on 09/12/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import XCTest
import Firebase
@testable import fit360

class mealTests: XCTestCase {
    var UUT: Meal!
    
    override func setUp() {
        super.setUp()
        UUT = Meal()
    }
    
    override func tearDown() {
        UUT = nil
        super.tearDown()
    }
    
    func testProperSetUp() {
        XCTAssertNotNil(UUT, "The food item was not nill")
    }
    
    func testGetMealExpectEmptyArray() {
        let emptyArray = UUT.getFoodItems()
        XCTAssertEqual(emptyArray.count, 0, "Get food items does not return array of food")
    }
    
    func testGetMealExpectFirstItemIsFoodItem() {
        
    }
}
