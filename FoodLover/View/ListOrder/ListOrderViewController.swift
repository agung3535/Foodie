//
//  ListOrderViewController.swift
//  FoodLover
//
//  Created by Putra on 07/11/21.
//

import UIKit
import ProgressHUD

class ListOrderViewController: UIViewController {

    @IBOutlet weak var orderTblView: UITableView!
    
    @IBOutlet weak var emptyOrder: UIView!
    
    var orders:[Order] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Orders"
        orderTblView.delegate = self
        orderTblView.dataSource = self
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchOrder{(result) in
            switch result {
            case .success(let data):
                ProgressHUD.dismiss()
                self.orders = data
                self.orderTblView.reloadData()
                if data.count == 0 {
                    self.emptyOrder.isHidden = false
                    self.orderTblView.isHidden = true
                }else {
                    self.emptyOrder.isHidden = true
                    self.orderTblView.isHidden = false
                }
            case .failure(let error):
                print("Error is: \(error.localizedDescription)")
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
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
