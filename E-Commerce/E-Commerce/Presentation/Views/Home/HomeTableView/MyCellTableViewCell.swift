//
//  MyCellTableViewCell.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 26/12/2023.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
