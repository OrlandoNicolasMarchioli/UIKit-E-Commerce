//
//  ProductsDelegate.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 19/02/2024.
//

import Foundation

protocol ProductsDelegate: AnyObject{
    func getProducts() -> [Product]
}
