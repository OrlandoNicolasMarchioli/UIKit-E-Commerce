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
        var counter = 0
        for p in getCartItems(){
            if(p.product.name == product.product.name){
                self.cartItems.remove(at: counter)
            }
            counter += 1
        }
    }
    
    func addToCart(product: ProductToBuy) {
        cartItems.append(product)
        print(product.product.name)
        print(cartItems.count)
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
        for product in cartItems{
            if(productToBuy.product.id == product.product.id){
                return true
            }
        }
        return false
    }
    
    private func addQuantityToAnExistantProduct(productToBuy: ProductToBuy){
        for index in cartItems.indices {
                if cartItems[index].product.id == productToBuy.product.id {
                    cartItems[index].quantity += productToBuy.quantity
                    return
                }
            }
    }
    
    func obtainCartTotal() -> Double{
        var cartTotal = 0.0
        for productToBuy in cartItems{
            cartTotal += productToBuy.product.price * Double(productToBuy.quantity)
        }
        return cartTotal
    }
}
