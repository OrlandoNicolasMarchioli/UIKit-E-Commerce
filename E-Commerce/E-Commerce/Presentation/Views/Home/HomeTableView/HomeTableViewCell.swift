//
//  HomeTableViewCell.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 15/01/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var itemName: UILabel!

    @IBOutlet var itemEliminate: UIButton!
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemType: UILabel!
    @IBOutlet var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        itemEliminate.setImage(UIImage(systemName: "trash"), for: .normal)
        itemEliminate.setTitle("", for: .normal)
        itemEliminate.imageView?.contentMode = .scaleAspectFit
        itemEliminate.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
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
        self.itemName.text = "$ " + product.name
        self.itemType.text = product.type
        self.itemPrice.text = String(product.price)
        self.itemImage.image = imageForName(name: product.image)
    }
    
    func imageForName(name: String) -> UIImage?{
        return UIImage(named: name)
    }
    
}


