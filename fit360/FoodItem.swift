//
//  FoodItem.swift
//  fit360
//
//  Created by Anders Opstrup on 08/11/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import Foundation

class FoodItem {
    private var _name: String?
    private var _calorie: Float?
    private var _protein: Float?
    private var _carbohydrate: Float?
    private var _fat: Float!
    
    init() {
        
    }
    
    init(name: String, calorie: Float, protein: Float, carbohydrate: Float, fat: Float) {
        self.setName(name: name)
        do {
            try self.setCalorie(amount: calorie)
            try self.setProtein(amount: protein)
            try self.setCarbohydrate(amount: carbohydrate)
            try self.setFat(amount: fat)
        } catch is Error {
            print("Error occurred!")
        }
    }
    
    func setName(name: String) {
        _name = name
    }
    
    func getName() -> String {
        return (_name != nil ? _name! : "")
    }
    
    func setCalorie(amount: Float) throws {
        if amount > 0 {
            _calorie = amount
        } else {
            throw FoodItemError.invalidCalorieAmount
        }
    }
    
    func getCalorie() -> Float {
        return (_calorie != nil ? _calorie! : 1.0)
    }
    
    func setProtein(amount: Float) throws {
        if amount > 0 {
            _protein = amount
        } else {
            throw FoodItemError.invalidProteinAmount
        }
    }
    
    func getProtein() -> Float {
        return (_protein != nil ? _protein! : 1.0)
    }
    
    func setCarbohydrate(amount: Float) throws {
        if amount > 0 {
            _carbohydrate = amount
        } else {
            throw FoodItemError.invalidCarbohydrateAmount
        }
    }
    
    func getCarbohydrate() -> Float {
        return (_carbohydrate != nil ? _carbohydrate! : 1.0)
    }
    
    func setFat(amount: Float) throws {
        if amount > 0 {
            _fat = amount
        } else {
            throw FoodItemError.invalidFatAmount
        }
    }
    
    func getFat() -> Float {
        return _fat
    }
}
