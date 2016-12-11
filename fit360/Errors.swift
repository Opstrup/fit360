//
//  Errors.swift
//  fit360
//
//  Created by Anders Opstrup on 10/12/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import Foundation

enum FoodItemError: Error {
    case invalidCalorieAmount
    case invalidProteinAmount
    case invalidCarbohydrateAmount
    case invalidFatAmount
}
