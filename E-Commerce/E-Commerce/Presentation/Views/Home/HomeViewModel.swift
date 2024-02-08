//
//  HomeViewModel.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 07/02/2024.
//

import Foundation

class HomeViewModel {
    private let productsRepository: ProductsRepository

    init(productsRepository: ProductsRepository) {
        self.productsRepository = productsRepository
    }

    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        productsRepository.fetchProducts(completion: completion)
    }
}
