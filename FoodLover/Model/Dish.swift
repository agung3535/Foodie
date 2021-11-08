//
//  Dish.swift
//  FoodLover
//
//  Created by Putra on 05/11/21.
//

import Foundation


struct Dish: Codable {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formattedCalories: String {
            return "\(calories ?? 0) calories"
        }
}
