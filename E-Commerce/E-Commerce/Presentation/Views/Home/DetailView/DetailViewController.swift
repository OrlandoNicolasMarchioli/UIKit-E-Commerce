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
    @IBOutlet weak var addToCartButton: CustomButton!
    @IBOutlet weak var lessButton: CustomButton!
    @IBOutlet weak var plusButton: CustomButton!
    
    @IBOutlet var starButton: CustomButton!
    // MARK: DetailViewController variables
    var delegate: DetailViewControllerDelegate?
    var product: Product = Product(image: "", name: "", type: "", price: 0)

    // MARK: DetailViewController ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productQuantity.text = "0"

        plusButton.customButtonWithSystemImage(radius: plusButton.bounds.width / 2, imageName: "plus")
        lessButton.customButtonWithSystemImage(radius: plusButton.bounds.width / 2, imageName: "minus")
        setStarStatus()
        
        addToCartButton.customButton(radius: 10)
        addToCartButton.isEnabled = false
        
        configure(product: product)
    
    }
    @IBAction func addQuantity(_ sender: Any) {
        guard let quantity = self.productQuantity.text else{
            return
        }
        self.productQuantity.text = String(Int(quantity)! + 1)
        checkAddToChartState()
    }
    
    @IBAction func reduceQuantity(_ sender: Any) {
        guard let quantity = self.productQuantity.text else{
            return
        }
        if(self.productQuantity.text! != "0"){
            self.productQuantity.text = String(Int(quantity)! - 1)
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
    
    
    @IBAction func addToFavoriteButton(_ sender: Any) {
        changeStarButtonBackground()
        if(starButtonIsFilled()){
            FavoriteManager.shared.saveFavorite(product: self.product)
        }else {
            FavoriteManager.shared.deleteFavorite(product: self.product)
        }
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { 
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
        guard let quantity = self.productQuantity.text else{
            return
        }
        if(Int(quantity)! > 0){
            self.addToCartButton.isEnabled = true
        }else{
            self.addToCartButton.isEnabled = false
        }
    }
    
    private func changeStarButtonBackground() -> Void{
        guard let image = self.starButton else{
            return
        }
        if (starButtonIsFilled()){
            image.setImage(UIImage(systemName: "star"), for: .normal)
        }else{
            image.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
    }
    
    private func setStarStatus(){
        if (!checkIfProductIsFavorite(product: product)){
            self.starButton.customButtonWithSystemImage(radius: 10, imageName: "star.fill")
        }else{
            self.starButton.customButtonWithSystemImage(radius: 10, imageName: "star")
        }
    }
    
    private func starButtonIsFilled() -> Bool{
        return self.starButton.image(for: .normal) == UIImage(systemName: "star.fill")
    }
    
    private func checkIfProductIsFavorite(product: Product) -> Bool{
        return FavoriteManager.shared.getFavorites().filter(){ $0.id == product.id }.isEmpty
    }
    
}
