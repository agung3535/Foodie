//
//  StringEkstension.swift
//  FoodLover
//
//  Created by Putra on 04/11/21.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
