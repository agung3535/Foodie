//
//  DishDetailViewController.swift
//  FoodLover
//
//  Created by Putra on 06/11/21.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var orderBtn: UIButton!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateView()
    }
    
    func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        dishLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLbl.text = dish.description
        
    }

  
    @IBAction func orderBtnClicked(_ sender: UIButton) {
    }
    
}
