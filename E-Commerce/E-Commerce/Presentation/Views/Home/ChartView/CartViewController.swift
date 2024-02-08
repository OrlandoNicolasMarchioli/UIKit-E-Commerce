//
//  ChartViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 24/01/2024.
//

import UIKit

class CartViewController: UIViewController, DetailViewControllerDelegate {
    
    
    @IBOutlet var cartEmptyImage: UIImageView!
    @IBOutlet var cartTableView: UITableView!
    var cartViewController: CartViewController?
    @IBOutlet var itemTotal: UILabel!
    var productsToBuy: [Product] = []
    @IBOutlet var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "cell")
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        confirmButton.layer.cornerRadius = 10
        confirmButton.isEnabled = false
        
        itemTotal.text = "0"
        
        cartEmptyImage.image = UIImage(named: "cart.fill.badge.plus")
        
        productsToBuy = CartManager.shared.cartItems
        if productsToBuy.isEmpty {
            cartEmptyImage.isHidden = false
        } else {
            cartEmptyImage.isHidden = true
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartTableView.reloadData()
    }
    
    
    @IBAction func didConfirmButtonTapped(_ sender: Any) {
        
    }
    
    func didAddToChart(product: Product, quantity: Int) {
        productsToBuy.append(product)
        itemTotal.text = String(Int(itemTotal.text!)! + quantity)
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsToBuy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productsToBuy[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(product: product)
        return cell
    }
}
