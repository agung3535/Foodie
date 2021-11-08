//
//  ListDishesViewController.swift
//  FoodLover
//
//  Created by Putra on 07/11/21.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dishes:[Dish] = [
        .init(id: "id1", name: "Curry", description: "This is the best curry that I've to tasted", image: "https://picsum.photos/100/200", calories: 30.0),
        .init(id: "id1", name: "Indomie", description: "This is the best curry that I've to tasted", image: "https://picsum.photos/100/200", calories: 30.0),
        .init(id: "id1", name: "Pizza", description: "This is the best curry that I've to tasted", image: "https://picsum.photos/100/200", calories: 30.0),
        .init(id: "id1", name: "Pizza", description: "This is the best curry that I've to tasted", image: "https://picsum.photos/100/200", calories: 30.0),
        .init(id: "id1", name: "Pizza", description: "This is the best curry that I've to tasted", image: "https://picsum.photos/100/200", calories: 30.0)
    ]
    
    var categories: DishCategory!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        title = categories.name
        registerCell()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    

}

extension ListDishesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
