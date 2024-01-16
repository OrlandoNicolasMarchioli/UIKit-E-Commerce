//
//  MyCellCollectionViewCell.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 05/01/2024.
//

import UIKit

class MyCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet var itemName: UILabel!
 
    @IBOutlet var itemImage: UIView!
    @IBOutlet var itemPrice: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
