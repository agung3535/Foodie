//
//  AppError.swift
//  FoodLover
//
//  Created by Putra on 08/11/21.
//

import Foundation


enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Bruhh !! I have no idea to go"
        case .invalidUrl:
            return "INVALID URL"
        case .serverError(let error):
            return error
        }
    }
}
