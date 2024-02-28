//
//  CartManager.swift
//  E-Commerce
//
//  Created by Axel Mosiejko on 08/02/2024.
//

import Foundation

class CartManager: DetailViewControllerDelegate {
    
    static let shared = CartManager()
    var cartItems = [ProductToBuy]()
    
    func getCartItems() -> [ProductToBuy] {
        return cartItems
    }
    
    func deleteItemFromCart(product: ProductToBuy){
        self.cartItems = cartItems.filter(){ $0 != product }
    }
    
    func addToCart(product: ProductToBuy) {
        cartItems.append(product)
    }
    
    // MARK: DetailViewControllerDelegate
    func didAddToChart(productToBuy: ProductToBuy) {
        if (!checkIfProductExistsOnCart(productToBuy: productToBuy)){
             addToCart(product: productToBuy)
        }else{
            addQuantityToAnExistantProduct(productToBuy: productToBuy)
        }
    }
    
    func checkIfProductExistsOnCart(productToBuy : ProductToBuy) -> Bool{
        return !cartItems.filter { $0.product.id == productToBuy.product.id }.isEmpty
    }
    
    private func addQuantityToAnExistantProduct(productToBuy: ProductToBuy){
        if let index = cartItems.firstIndex(where: { $0.product.id == productToBuy.product.id }) {
                cartItems[index].quantity += productToBuy.quantity
            }
    }
    
    func obtainCartTotal() -> Double{
        var cartTotal = 0.0
        for productToBuy in cartItems{
            cartTotal += productToBuy.product.price * Double(productToBuy.quantity)
        }
        return cartTotal
    }
    
    func deleteAllProductsFromCart() -> Void{
        self.cartItems.removeAll()
    }
}
