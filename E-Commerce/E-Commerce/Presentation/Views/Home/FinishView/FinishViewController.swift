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
    var cartStateApprobed = CartManager.shared.getCartApprobed()
    var productsBought : [ProductToBuy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCartApprobedImage()
        finishOkButton.customButton(radius: 10)
    }
    @IBAction func finishOkButtonTapped(_ sender: Any) {
        self.dismiss(animated: true) {
                if let homeVC = UIStoryboard(name: "HomeViewController", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                    homeVC.modalPresentationStyle = .fullScreen
                    self.present(homeVC, animated: true, completion: nil)
                }
            }
    }
    
    func configureCartApprobedImage(){
        if(cartStateApprobed){
            self.finishImage.image = UIImage(named: "cartApprobed")
        }else{
            self.finishImage.image = UIImage(named: "buyProblem")
        }
    }
    
}