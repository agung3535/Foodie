//
//  DishDetailViewController.swift
//  FoodLover
//
//  Created by Putra on 06/11/21.
//

import UIKit
import ProgressHUD

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
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
            
        }
        ProgressHUD.show("Placing Order . . ")
        NetworkService.shared.placeOrdeR(dishId: dish.id ?? "", name: name) {result in
            switch result {
            case .success(_):
                ProgressHUD.showSucceed("Your order has been received")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
}
