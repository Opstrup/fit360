//
//  Meal.swift
//  fit360
//
//  Created by Anders Opstrup on 07/12/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import Foundation

class Meal {
    private var _foodItems = [FoodItem]()
    
    func addFoodItem(foodItem: FoodItem) {
        _foodItems.append(foodItem)
    }
    
    func getFoodItems() -> [String] {
        return [String]()
    }
}
