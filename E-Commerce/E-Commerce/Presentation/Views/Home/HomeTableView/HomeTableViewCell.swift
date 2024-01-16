//
//  HomeTableViewCell.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 15/01/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemType: UIView!
    @IBOutlet var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configure(product: Product){
//        self.itemName.text = "$ " + product.name
//    }
    
}


