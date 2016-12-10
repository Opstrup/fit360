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
    private var _protein: Float!
    private var _carbohydrate: Float!
    private var _fat: Float!
    
    init() {
        
    }
    
    init(name: String, calorie: Float) {
        self.setName(name: name)
        do {
            try self.setCalorie(amount: calorie)
        } catch is Error {
            print("Invalid calorie amount!")
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
    
    func setProtein(amount: Float) {
        _protein = amount
    }
    
    func getProtein() -> Float {
        return _protein
    }
    
    func setCarbohydrate(amount: Float) {
        _carbohydrate = amount
    }
    
    func getCarbohydrate() -> Float {
        return _carbohydrate
    }
    
    func setFat(amount: Float) {
        _fat = amount
    }
    
    func getFat() -> Float {
        return _fat
    }
}
