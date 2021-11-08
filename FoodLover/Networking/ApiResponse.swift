//
//  ApiResponse.swift
//  FoodLover
//
//  Created by Putra on 08/11/21.
//

import Foundation


struct ApiResponse<T: Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
