//
//  CategoryCollectionViewCell.swift
//  FoodLover
//
//  Created by Putra on 04/11/21.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    func setup(category: DishCategory) {
        
        categoryLabel.text = category.name
        categoryImage.kf.setImage(with: category.image.asUrl)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
