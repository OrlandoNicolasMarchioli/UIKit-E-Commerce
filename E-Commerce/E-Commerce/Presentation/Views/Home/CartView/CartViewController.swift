//
//  ChartViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 24/01/2024.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: IBOutlet connections
    @IBOutlet weak var cartEmptyImage: UIImageView!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var itemTotal: UILabel!
    @IBOutlet weak var confirmButton: CustomButton!
    
    // MARK: CartViewController variables
    var productsToBuy: [ProductToBuy] = []
    var cartViewController: CartViewController?
    let verticalCellSpacing: CGFloat = 70.0
    
    // MARK: CartViewController ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: "cell")
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        confirmButton.customButton(radius: 10)
        
        itemTotal.text = "0"
        
        checkIfHasToBeEnabled()
        
        setProductsToBuy()
        
        configureCartEmptyImage(cartImage: cartEmptyImage)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartTableView.reloadData()
    }
    
    
    @IBAction func didConfirmButtonTapped(_ sender: Any) {
        showConfirmCartAlert()
    }
    
    @objc func deleteProduct(_ sender: UIButton) {
        guard let cell = sender.superview?.superview as? HomeTableViewCell else {
            return
        }
        
        if let indexPath = cartTableView.indexPath(for: cell) {
            CartManager.shared.deleteItemFromCart(product: productsToBuy[indexPath.row])
            productsToBuy.remove(at: indexPath.row)
            
            itemTotal.text = String(CartManager.shared.obtainCartTotal())
            
            checkIfHasToBeEnabled()
        
            cartTableView.reloadData()
        }
    }
    
    private func showConfirmCartAlert() {
        let alertController = UIAlertController(title: "Estas por confirmar tu pedido por: ", message: " $ \(CartManager.shared.obtainCartTotal())", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let acceptAction = UIAlertAction(title: "Accept", style: .default) { [weak self] _ in
            self?.handleAcceptAction()
        }
        alertController.addAction(acceptAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func handleAcceptAction() {
        CartManager.shared.deleteAllProductsFromCart()
        self.productsToBuy.removeAll()
        self.itemTotal.text = "0"
        self.cartTableView.reloadData()
        checkIfHasToBeEnabled()
    }
    
    
    func checkIfHasToBeEnabled(){
        if productsToBuy.isEmpty {
            cartEmptyImage.isHidden = false
            confirmButton.isEnabled = false
            
        } else {
            cartEmptyImage.isHidden = true
            confirmButton.isEnabled = true
            itemTotal.text = String(CartManager.shared.obtainCartTotal())
        }
    }
    
    func configureCartEmptyImage(cartImage: UIImageView ){
        cartImage.image = UIImage(systemName: "cart.fill.badge.plus")
    }
    
    func setProductsToBuy() -> Void{
        self.productsToBuy = CartManager.shared.cartItems
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
        cell.deleteItemButton.isHidden = false
        cell.itemTotal.isHidden = false
        cell.itemTotal.text =  "$ " + String(Int(productToBuy.quantity) * Int(productToBuy.product.price))
        cell.itemPrice.isHidden = true
        cell.deleteItemButton.addTarget(self, action:#selector(deleteProduct(_:)), for: .touchUpInside)
        checkIfHasToBeEnabled()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  verticalCellSpacing
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return verticalCellSpacing
    }
}
