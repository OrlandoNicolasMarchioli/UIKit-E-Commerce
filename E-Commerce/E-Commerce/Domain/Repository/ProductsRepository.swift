//
//  ProductsRepository.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 19/02/2024.
//

import Foundation


class ProductsRepository: ProductsDelegate{
    
    var productApiProtocol: ProductApiProtocol
    
    init(productApiProtocol: ProductApiProtocol) {
        self.productApiProtocol = productApiProtocol
    }
    
    var productsMock: [Product] =  [Product(image: "vino", name: "Vino toro", type: "bebidas", price: 2500.0),Product(image: "aceituna", name: "Aceitunas sin carozo", type: "frutas", price: 1000.0),Product(image: "cervezaCorona", name: "Cerveza corona 300cc", type: "bebidas", price: 2500),Product(image: "quesoFresco", name: "Queso fresco ", type: "quesos", price: 5460.0),Product(image: "LecheEnteraLaSerenisima", name: "Leche entera 1L", type: "bebidas s/ alcohol", price: 1500),Product(image: "anana", name: "Anana", type: "frutas", price: 750)]
    
    func getProducts() -> [Product] {
        return productApiProtocol.products
    }


    
}
