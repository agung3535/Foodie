//
//  DishCategory.swift
//  FoodLover
//
//  Created by Putra on 04/11/21.
//

import Foundation


struct DishCategory: Codable {
    let id, name, image: String
    
    enum CodingKeys: String, CodingKey {
            case id
            case name = "title"
            case image
        }
}
