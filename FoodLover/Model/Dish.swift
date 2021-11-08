//
//  Dish.swift
//  FoodLover
//
//  Created by Putra on 05/11/21.
//

import Foundation


struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%.2f calories", calories ?? 0)
    }
}
