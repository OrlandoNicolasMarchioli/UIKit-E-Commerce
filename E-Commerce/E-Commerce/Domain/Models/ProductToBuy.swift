//
//  ProductToBuy.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 08/02/2024.
//

import Foundation

struct ProductToBuy: Hashable, Identifiable{
    let id = UUID()
    let product : Product
    var quantity : Int
}
