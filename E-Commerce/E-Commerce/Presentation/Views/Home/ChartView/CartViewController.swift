//
//  ChartViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 24/01/2024.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet var cartTableView: UITableView!
    
    @IBOutlet var itemTotal: UILabel!
    var productsToBuy: [Product] = []

    @IBOutlet var confirmButton: UIButton!
    

    @IBOutlet var chartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmButton.layer.cornerRadius = 10

    }
    

    @IBAction func didConfirmButtonTapped(_ sender: Any) {
    }
    
}
