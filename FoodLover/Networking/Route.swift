//
//  Route.swift
//  FoodLover
//
//  Created by Putra on 07/11/21.
//

import Foundation


enum Route {
  
    static let baseUrl = "https://yummie.glitch.me"
    
    case temp
    case fetchAllCategories
    case placeOrder(String)
    case fetchCategoryDishes(String)
    case fetchOrders
    
    var description: String {
        switch self {
        case .temp:
            return "/dishes/cat1"
        case .fetchAllCategories:
            return "/dish-categories"
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        case .fetchCategoryDishes(let categoryId):
            return "/dishes/\(categoryId)"
        case .fetchOrders:
            return "/orders"
        }
    }
    
}
