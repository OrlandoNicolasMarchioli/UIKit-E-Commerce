//
//  DetailViewControllerDelegate.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 06/02/2024.
//

import Foundation

protocol DetailViewControllerDelegate: AnyObject{
    func didAddToChart(product: Product, quantity: Int)
}
