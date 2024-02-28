//
//  FavoriteManager.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 21/02/2024.
//

import Foundation

class FavoriteManager: FavoritesDelegate {
    static let shared = FavoriteManager()
    var favorites : [Product] = []
    
    func getFavorites() -> [Product] {
        return favorites
    }
    
    func saveFavorite(product: Product) {
        favorites.append(product)
    }
    
    func deleteFavorite(product: Product) {
        self.favorites = favorites.filter(){ $0 != product }
    }
    
    
}
