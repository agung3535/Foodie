//
//  ListOrderViewController.swift
//  FoodLover
//
//  Created by Putra on 07/11/21.
//

import UIKit

class ListOrderViewController: UIViewController {

    @IBOutlet weak var orderTblView: UITableView!
    
    
    var orders:[Order] = [
        .init(id: "id1", name: "Agung", dish: .init(id: "id1", name: "Indomie", description: "This is the best noodle", image: "https://picsum.photos/100/200", calories: 30.0)),
        .init(id: "id1", name: "Kyomi", dish: .init(id: "id1", name: "Indomie", description: "This is the best noodle", image: "https://picsum.photos/100/200", calories: 30.0)),
        .init(id: "id1", name: "Natasha", dish: .init(id: "id1", name: "Indomie", description: "This is the best noodle", image: "https://picsum.photos/100/200", calories: 30.0))
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Orders"
        orderTblView.delegate = self
        orderTblView.dataSource = self
        registerCells()
        
        // Do any additional setup after loading the view.
    }
    
    func registerCells() {
        orderTblView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    

}

extension ListOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("masuk count")
        return orders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
