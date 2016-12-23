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
    private var _time = NSDate()
    
    func setTimeForMeal(time: NSDate) {
        _time = time
    }
    
    func getTimeForMeal() -> NSDate {
        return _time
    }
    
    func addFoodItem(foodItem: FoodItem) {
        _foodItems.append(foodItem)
    }
    
    func getFoodItems() throws -> [FoodItem] {
        if !_foodItems.isEmpty {
            return _foodItems
        } else {
            throw MealError.emptyMeal
        }
    }
    
    /*
     * Maybe add some validation here
     * with empty meals
     */
    
    func getTotalCalorieCount() -> Float {
        if !_foodItems.isEmpty {
            var calorieCount: Float = 0.0
            for foodItem in _foodItems {
                calorieCount.add(foodItem.getCalorie())
            }
            return calorieCount
        } else {
            return 0.0
        }
    }
    
    func getTotalProteinCount() -> Float {
        if !_foodItems.isEmpty {
            var proteinCount: Float = 0.0
            for foodItem in _foodItems {
                proteinCount.add(foodItem.getProtein())
            }
            return proteinCount
        } else {
            return 0.0
        }
    }
    
    func getTotalCarbohydrateCount() -> Float {
        if !_foodItems.isEmpty {
            var carbohydrateCount: Float = 0.0
            for foodItem in _foodItems {
                carbohydrateCount.add(foodItem.getCarbohydrate())
            }
            return carbohydrateCount
        } else {
            return 0.0
        }
    }
    
    func getTotalFatCount() -> Float {
        if !_foodItems.isEmpty {
            var fatCount: Float = 0.0
            for foodItem in _foodItems {
                fatCount.add(foodItem.getFat())
            }
            return fatCount
        } else {
            return 0.0
        }
    }
}
