//
//  DetailViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 30/01/2024.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    // MARK: IBOutlet connections
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var addToCartButton: ButtonCustomizer!
    @IBOutlet weak var lessButton: ButtonCustomizer!
    @IBOutlet weak var plusButton: ButtonCustomizer!
    
    // MARK: DetailViewController variables
    var delegate: DetailViewControllerDelegate?
    var product: Product = Product(image: "", name: "", type: "", price: 0)

    // MARK: DetailViewController ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productQuantity.text = "0"
        plusButton.setTitle("", for: .normal)
        plusButton.imageView?.contentMode = .scaleAspectFit
        plusButton.customButtonWithSystemImage(radius: plusButton.bounds.width / 2, imageName: "plus")
        
        lessButton.setTitle("", for: .normal)
        lessButton.imageView?.contentMode = .scaleAspectFit
        lessButton.customButtonWithSystemImage(radius: plusButton.bounds.width / 2, imageName: "minus")
        
        addToCartButton.customButton(radius: 10)
        addToCartButton.isEnabled = false
        
        configure(product: product)
    
    }
    @IBAction func addQuantity(_ sender: Any) {
        self.productQuantity.text = String(Int(self.productQuantity.text!)! + 1)
        checkAddToChartState()
    }
    
    @IBAction func reduceQuantity(_ sender: Any) {
        if(self.productQuantity.text! != "0"){
            self.productQuantity.text = String(Int(self.productQuantity.text!)! - 1)
        }
        checkAddToChartState()
    }

    @IBAction func addToCart(_ sender: Any) {
        guard let quantity = Int(productQuantity.text ?? "0"), quantity > 0 else {
            return
        }
        CartManager.shared.didAddToChart(productToBuy: ProductToBuy(product: product, quantity: quantity))
        self.productQuantity.text = "0"
        checkAddToChartState()
        showAlert(message: "Product added to cart")
    }

    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                alertController.dismiss(animated: true, completion: nil)
            }
    }
    
    private func configure(product: Product){
        self.productImage.image = UIImage(named: product.image)
        self.productName.text = product.name
        self.productPrice.text = "$ " + String(product.price)
        self.productDescription.text = product.type
        
    }
    
    private func checkAddToChartState(){
        if(Int(self.productQuantity.text!)! > 0){
            self.addToCartButton.isEnabled = true
        }else{
            self.addToCartButton.isEnabled = false
        }
    }
    
}
