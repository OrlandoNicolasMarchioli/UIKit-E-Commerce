//
//  ProductApiProtocol.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 15/03/2024.
//

import Foundation
import MongoSwift
import NIO

class ProductApiProtocol {
    
    var products: [Product] = []
    private let databaseConnection = MongoDBManager(databaseName: "admin")
    
    func fetchProducts() {
        let database = databaseConnection
        let productsCollection = database.getDatabase().collection("products")
        let cursor = productsCollection.find()
        
        decodeProductsData(cursor)
    }
    
    func decodeProductsData(_ cursor: EventLoopFuture<MongoCursor<BSONDocument>>) -> Void{
        cursor.flatMap { result in
            result.toArray()
        }.whenComplete { result in
            switch result {
            case .success(let documents):
                do {
                    var decodedProducts: [Product] = []
                    let decoder = BSONDecoder()
                    for document in documents {
                        let product = try decoder.decode(Product.self, from: document)
                        decodedProducts.append(product)
                    }
                    DispatchQueue.main.async {
                        self.products = decodedProducts
                    }
                } catch {
                    print("Error decoding product: \(error)")
                }
            case .failure(let error):
                print("Error retrieving products: \(error)")
            }
        }
    }
}

