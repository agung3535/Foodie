//
//  HomeViewController.swift
//  FoodLover
//
//  Created by Putra on 04/11/21.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialCollectionView: UICollectionView!
    var categories: [DishCategory] = []
    
    var popularDish: [Dish] = []
    
    var chefDish: [Dish] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories{(result) in
            switch result {
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self.categories = allDishes.categories ?? []
                self.popularDish = allDishes.populars ?? []
                self.chefDish = allDishes.specials ?? []
                
                self.categoryCollectionView.reloadData()
                self.popularCollectionView.reloadData()
                self.specialCollectionView.reloadData()
            case .failure(let error):
                print("error is :\(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
        }

        // Do any additional setup after loading the view.
        title = "Foodie"
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        specialCollectionView.delegate = self
        specialCollectionView.dataSource = self
        registerCell()
        
    }
    
    private func registerCell() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        popularCollectionView.register(UINib(nibName: DishPotraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPotraitCollectionViewCell.identifier)
        specialCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return popularDish.count
        case specialCollectionView:
            return chefDish.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPotraitCollectionViewCell.identifier, for: indexPath) as! DishPotraitCollectionViewCell
            cell.setup(dish: popularDish[indexPath.row])
            return cell
        case specialCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: chefDish[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.categories = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? popularDish[indexPath.row] : chefDish[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
