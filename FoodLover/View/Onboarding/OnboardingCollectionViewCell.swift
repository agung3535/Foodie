//
//  OnboardingCollectionViewCell.swift
//  FoodLover
//
//  Created by Putra on 04/11/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var slideTitle: UILabel!
    @IBOutlet var slideDescription: UILabel!
    @IBOutlet var slideImageView: UIImageView!
    
    func setup(_ slide: OnBoardingSlide) {
        slideTitle.text = slide.title
        slideImageView.image = slide.image
        slideDescription.text = slide.description 
    }
}
