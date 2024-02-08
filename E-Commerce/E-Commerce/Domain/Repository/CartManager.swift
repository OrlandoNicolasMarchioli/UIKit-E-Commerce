//
//  CartManager.swift
//  E-Commerce
//
//  Created by Axel Mosiejko on 08/02/2024.
//

import Foundation

class CartManager: DetailViewControllerDelegate {
    
    static let shared = CartManager()
    var cartItems = [Product]() // TODO: CREATE ANOTHER MODEL THAT CONTAINS THE Product OBJECT AND THE QUANTITY
    
    func getCartItems() -> [Product] {
        return cartItems
    }
    
    func addToCart(product: Product, quantity: Int) {
        cartItems.append(product)
        print(product.name)
        print(cartItems.count)
    }
    
    // MARK: DetailViewControllerDelegate
    func didAddToChart(product: Product, quantity: Int) {
        addToCart(product: product, quantity: quantity)
    }
}
