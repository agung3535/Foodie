//
//  UIViewControllerExtensions.swift
//  FoodLover
//
//  Created by Putra on 06/11/21.
//

import Foundation
import UIKit


extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
    
    
}
