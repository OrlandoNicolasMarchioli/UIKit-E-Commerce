//
//  HomeTableViewCell.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 15/01/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // MARK: HomeTableViewCell IBOutlet connections
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemTotal: UILabel!
    @IBOutlet var itemTypeLabel: UILabel!
    @IBOutlet var deleteItemButton: ButtonCustomizer!
    
    // MARK: HomeTableViewCell ViewLifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

        deleteItemButton.customButtonWithSystemImage(radius: deleteItemButton.bounds.width / 2, imageName: "trash")
        deleteItemButton.setTitle("", for: .normal)
        deleteItemButton.imageView?.contentMode = .scaleAspectFit
        
        itemTotal.isHidden = true
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
        self.itemTypeLabel.text = product.type
        self.itemPrice.text = String(product.price)
        self.itemImage.image = imageForName(name: product.image)
    }
    
    private func imageForName(name: String) -> UIImage?{
        return UIImage(named: name)
    }
    
}


