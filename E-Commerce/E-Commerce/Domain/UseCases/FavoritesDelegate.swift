//
//  FavoritesDelegate.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 21/02/2024.
//

import Foundation

protocol FavoritesDelegate: AnyObject{
    func getFavorites() -> [Product]
    func saveFavorite(product: Product) -> Void
    func deleteFavorite(product: Product) -> Void
}
