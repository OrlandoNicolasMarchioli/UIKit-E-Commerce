//
//  MyCellCollectionViewCell.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 05/01/2024.
//

import UIKit

class MyCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 5
        layer.masksToBounds = false
    }
    
    func configure(product: Product){
        self.itemName.text =  product.name
        self.itemPrice.text = "$ " + String(product.price)
        self.itemImage.image = imageForName(name: product.image)
    }
    
    func imageForName(name: String) -> UIImage?{
        return UIImage(named: name)
    }
    
}
