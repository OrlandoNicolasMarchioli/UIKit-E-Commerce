//
//  ChartViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 24/01/2024.
//

import UIKit

class CartViewController: UIViewController {
    
    
    @IBOutlet var cartEmptyImage: UIImageView!
    @IBOutlet var cartTableView: UITableView!
    var cartViewController: CartViewController?
    @IBOutlet var itemTotal: UILabel!
    var productsToBuy: [ProductToBuy] = []
    @IBOutlet var confirmButton: UIButton!
    let verticalCellSpacing: CGFloat = 70.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "cell")
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        confirmButton.layer.cornerRadius = 10
        
        itemTotal.text = "0"
        
        productsToBuy = CartManager.shared.cartItems
        cartEmptyImage.image = UIImage(systemName: "cart.fill.badge.plus")
        
        if productsToBuy.isEmpty {
            cartEmptyImage.isHidden = false
            confirmButton.isEnabled = false
            
        } else {
            cartEmptyImage.isHidden = true
            confirmButton.isEnabled = true
            itemTotal.text = String(CartManager.shared.obtainCartTotal())
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartTableView.reloadData()
    }
    
    
    @IBAction func didConfirmButtonTapped(_ sender: Any) {
        
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsToBuy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productToBuy = productsToBuy[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(product: productToBuy.product)
        cell.itemEliminate.isHidden = false
        cell.itemTotal.isHidden = false
        cell.itemTotal.text =  String(Int(productToBuy.quantity) * Int(productToBuy.product.price))
        cell.itemPrice.isHidden = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  verticalCellSpacing
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return verticalCellSpacing
    }
}
