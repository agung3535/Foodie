//
//  DishPotraitCollectionViewCell.swift
//  FoodLover
//
//  Created by Putra on 05/11/21.
//

import UIKit

class DishPotraitCollectionViewCell: UICollectionViewCell {

    static let identifier = "DishPotraitCollectionViewCell"
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var imageViewFood: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        foodLabel.text = dish.formattedCalories
        descLabel.text = dish.description
        imageViewFood.kf.setImage(with:dish.image?.asUrl)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageViewFood.layer.cornerRadius = 10
    }

}
