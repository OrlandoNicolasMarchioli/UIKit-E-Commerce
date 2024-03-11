//
//  FinishViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 07/03/2024.
//

import Foundation
import UIKit

class FinishViewController: UIViewController{
    
    @IBOutlet var finishImage: UIImageView!
    @IBOutlet var finishOkButton: CustomButton!
    var cartStateApproved = CartManager.shared.getCartApproved()
    var productsBought : [ProductToBuy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCartApprobedImage()
        finishOkButton.customButton(radius: 10)
    }
    @IBAction func finishOkButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func configureCartApprobedImage(){
        if(cartStateApproved){
            self.finishImage.image = UIImage(named: "cartApprobed")
        }else{
            self.finishImage.image = UIImage(named: "buyProblem")
        }
    }
    
}
