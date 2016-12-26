//
//  foodItemTests.swift
//  fit360
//
//  Created by Anders Opstrup on 06/12/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import XCTest
import Firebase
@testable import fit360

class foodItemTests: XCTestCase {
    var UUT: FoodItem!
    
    override func setUp() {
        super.setUp()
        UUT = FoodItem()
    }
    
    override func tearDown() {
        UUT = nil
        super.tearDown()
    }
    
    func testProperSetUp() {
        XCTAssertNotNil(UUT, "The food item was nill")
    }
    
    func testGetAndSetFoodItemName() {
        UUT.setName(name: "Chicken")
        XCTAssertEqual(UUT.getName(), "Chicken", "The getName did not return the correct value")
    }
    
    func testGetAndSetFoodItemCalorie() {
        do {
            try UUT.setCalorie(amount: 304.20)
        } catch {
            print(error.localizedDescription)
        }
        XCTAssertEqual(UUT.getCalorie(), 304.20, "The getCalorie did not return the correct value")
    }
    
    func testGetAndSetFoodItemProtein() {
        do {
            try UUT.setProtein(amount: 25.3)
        } catch {
            print(error.localizedDescription)
        }
        XCTAssertEqual(UUT.getProtein(), 25.3, "The getProtein did not return the correct value")
    }
    
    func testGetAndSetFoodItemCarbohydrate() {
        do {
            try UUT.setCarbohydrate(amount: 20.0)
        } catch {
            print(error.localizedDescription)
        }
        XCTAssertEqual(UUT.getCarbohydrate(), 20.0, "The getCarbohydrate did not return the correct value")
    }
    
    func testGetAndSetFoodItemFat() {
        do {
            try UUT.setFat(amount: 10.5)
        } catch {
            print(error.localizedDescription)
        }
        XCTAssertEqual(UUT.getFat(), 10.5, "The getFat did not return the correct value")
    }
    
    func testCaloriesCanOnlyBePositivNumbers() {
        XCTAssertThrowsError(try UUT.setCalorie(amount: -1.0)) { (error) -> Void in
            XCTAssertEqual(error as? FoodItemError, FoodItemError.invalidCalorieAmount)
        }
    }
    
    func testProteinCanOnlyBePositivNumbers() {
        XCTAssertThrowsError(try UUT.setProtein(amount: -1.0)) { (error) -> Void in
            XCTAssertEqual(error as? FoodItemError, FoodItemError.invalidProteinAmount)
        }
    }
    
    func testCarbohydrateCanOnlyBePositivNumbers() {
        XCTAssertThrowsError(try UUT.setCarbohydrate(amount: -1.0)) { (error) -> Void in
            XCTAssertEqual(error as? FoodItemError, FoodItemError.invalidCarbohydrateAmount)
        }
    }
    
    func testFatCanOnlyBePositivNumbers() {
        XCTAssertThrowsError(try UUT.setFat(amount: -1.0)) { (error) -> Void in
            XCTAssertEqual(error as? FoodItemError, FoodItemError.invalidFatAmount)
        }
    }
    
    func testConstructorExpectCorrectFoodItem() {
        let myFoodItem = FoodItem(name: "Chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        XCTAssertEqual(myFoodItem.getName(), "Chicken", "The foodItem was not created correct")
    }
    
    func testConstructorExpectFoodItemWithCalories() {
        let myFoodItem = FoodItem(name: "Chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        XCTAssertEqual(myFoodItem.getCalorie(), 10.0, "The foodItem was not created correct")
    }
    
    func testConstructorExpectFoodItemWithProtein() {
        let myFoodItem = FoodItem(name: "Chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        XCTAssertEqual(myFoodItem.getProtein(), 10.0, "The foodItem was not created correct")
    }
    
    func testConstructorExpectFoodItemWithCarbohydrate() {
        let myFoodItem = FoodItem(name: "Chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        XCTAssertEqual(myFoodItem.getCarbohydrate(), 10.0, "The foodItem was not created correct")
    }
    
    func testConstructorExpectFoodItemWithFat() {
        let myFoodItem = FoodItem(name: "Chicken", calorie: 10.0, protein: 10.0, carbohydrate: 10.0, fat: 10.0)
        XCTAssertEqual(myFoodItem.getFat(), 10.0, "The foodItem was not created correct")
    }
}
