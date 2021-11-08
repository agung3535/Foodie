//
//  UIViewExtenstions.swift
//  FoodLover
//
//  Created by Putra on 04/11/21.
//

import Foundation
import UIKit


extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
