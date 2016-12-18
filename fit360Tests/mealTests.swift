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
    
    func testGetMealExpectErrorEmptyMealThorwn() {
        XCTAssertThrowsError(try UUT.getFoodItems()) { (error) -> Void in
            XCTAssertEqual(error as? MealError, MealError.emptyMeal)
        }
    }
    
    func testGetMealExpectFirstItemIsFoodItem() {
        let testFoodItem = FoodItem(name: "chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        UUT.addFoodItem(foodItem: testFoodItem)
        do {
            let mealArray = try UUT.getFoodItems()
            XCTAssertEqual(mealArray[0].getName(), "chicken", "Food item was not added to the meal")
        } catch is Error { }
    }
    
    func testGetTotalCalorieOfEmptyMealExpect0() {
        XCTAssertEqual(UUT.getTotalCalorieCount(), 0.0, "Total calorie count of empty meal is not 0.0")
    }
    
    func testGetTotalCalorieOfMealWithOneFoodItemExpect10() {
        let testFoodItem = FoodItem(name: "chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        UUT.addFoodItem(foodItem: testFoodItem)
        XCTAssertEqual(UUT.getTotalCalorieCount(), 10.0, "Total calorie count of empty meal is not 0.0")
    }
    
    func testGetTotalCalorieOfMealWithTwoFoodItemExpect20() {
        let testFoodItem = FoodItem(name: "chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        UUT.addFoodItem(foodItem: testFoodItem)
        UUT.addFoodItem(foodItem: testFoodItem)
        XCTAssertEqual(UUT.getTotalCalorieCount(), 20.0, "Total calorie count of meal is not 20.0")
    }
    
    func testGetTotalProteinOfMealWithTwoFoodItemExpect20() {
        let testFoodItem = FoodItem(name: "chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        UUT.addFoodItem(foodItem: testFoodItem)
        UUT.addFoodItem(foodItem: testFoodItem)
        XCTAssertEqual(UUT.getTotalProteinCount(), 20.0, "Total protein count of meal is not 20.0")
    }
    
    func testGetTotalCarbohydrateOfMealWithTwoFoodItemExpect20() {
        let testFoodItem = FoodItem(name: "chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        UUT.addFoodItem(foodItem: testFoodItem)
        UUT.addFoodItem(foodItem: testFoodItem)
        XCTAssertEqual(UUT.getTotalCarbohydrateCount(), 20.0, "Total carbohydrate count of meal is not 20.0")
    }
    
    func testGetTotalFatOfMealWithTwoFoodItemExpect20() {
        let testFoodItem = FoodItem(name: "chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        UUT.addFoodItem(foodItem: testFoodItem)
        UUT.addFoodItem(foodItem: testFoodItem)
        XCTAssertEqual(UUT.getTotalFatCount(), 20.0, "Total fat count of meal is not 20.0")
    }
}
