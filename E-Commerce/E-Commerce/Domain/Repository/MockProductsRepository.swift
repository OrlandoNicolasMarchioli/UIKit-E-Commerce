//
//  MockProductsRepository.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 07/02/2024.
//

import Foundation

class MockProductsRepository: ProductsRepository {
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        // Return the mock data (same as your initial array)
        let mockProducts: [Product] = [
            Product(image: "vino", name: "Vino toro", type: "bebidas", price: 2500.0),
            Product(image: "aceituna", name: "Aceitunas sin carozo", type: "frutas", price: 1000.0),
            Product(image: "cervezaCorona", name: "Cerveza corona 300cc", type: "bebidas", price: 2500.0),
            Product(image: "quesoFresco", name: "Queso fresco", type: "quesos", price: 5460.0),
            Product(image: "LecheEnteraLaSerenisima", name: "Leche entera 1L", type: "bebidas s/ alcohol", price: 1500.0),
            Product(image: "anana", name: "Anana", type: "frutas", price: 750.0)
        ]
        completion(mockProducts)
    }
}
