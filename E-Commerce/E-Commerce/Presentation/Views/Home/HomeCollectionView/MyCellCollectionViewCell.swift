//
//  MyCellCollectionViewCell.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 05/01/2024.
//

import UIKit

class MyCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemPrice: UILabel!
    @IBOutlet var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(product: Product){
        self.itemName.text = "$ " + product.name
        self.itemPrice.text = String(product.price)
    }

}
