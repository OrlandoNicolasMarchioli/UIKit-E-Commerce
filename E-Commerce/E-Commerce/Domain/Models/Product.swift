//
//  Product.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 15/01/2024.
//

import Foundation


struct Product:  Hashable, Identifiable, Codable {
    var id = UUID()
    let image : String
    let name : String
    let type : String
    let price : Double
}
