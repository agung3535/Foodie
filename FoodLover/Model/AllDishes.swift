//
//  AllDishes.swift
//  FoodLover
//
//  Created by Putra on 08/11/21.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
