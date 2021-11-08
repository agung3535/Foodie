//
//  DishLandscapeCollectionViewCell.swift
//  FoodLover
//
//  Created by Putra on 05/11/21.
//

import UIKit
import Kingfisher
class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishLandscapeCollectionViewCell"
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgDish: UIImageView!
    
    func setup(dish: Dish) {
        imgDish.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgDish.layer.cornerRadius = 5
    }

}
