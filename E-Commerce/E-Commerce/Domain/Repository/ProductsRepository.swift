//
//  ProductsRepositoy.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 07/02/2024.
//

import Foundation

protocol ProductsRepository {
    func fetchProducts(completion: @escaping ([Product]) -> Void)
}
