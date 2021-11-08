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
    
    var description: String {
        switch self {
            
        case .temp: return "/dish-categories"
        }
    }
    
}
