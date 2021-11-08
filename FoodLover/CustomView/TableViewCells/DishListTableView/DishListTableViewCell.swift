//
//  DishListTableViewCell.swift
//  FoodLover
//
//  Created by Putra on 07/11/21.
//

import UIKit
import Kingfisher
class DishListTableViewCell: UITableViewCell {

    static let identifier = "DishListTableViewCell"
    
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var dishDesc: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    
    
    func setup(dish: Dish) {
        dishImage.kf.setImage(with: dish.image?.asUrl)
        dishTitle.text = dish.name
        dishDesc.text = dish.description
    }
    
    func setup(order: Order) {
        dishImage.kf.setImage(with: order.dish?.image?.asUrl)
        dishTitle.text = order.name
        dishDesc.text = order.dish?.description
    }
    
    
    
}
