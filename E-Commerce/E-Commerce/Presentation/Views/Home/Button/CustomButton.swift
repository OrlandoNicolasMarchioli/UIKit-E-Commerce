//
//  ButtonCustomizer.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 19/02/2024.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    
    func customButtonWithSystemImage( radius: CGFloat, imageName: String) -> Void{
        configureSystemNameButtonImage(systemName: imageName)
        self.layer.cornerRadius = radius
    }
    
    func customButton(radius: CGFloat, imageName: String) -> Void{
        configureButtonImage(name: imageName)
        self.layer.cornerRadius = radius
    }
    
    func customButton(radius: CGFloat) -> Void{
        self.layer.cornerRadius = radius
    }
    
    func configureSystemNameButtonImage(systemName: String){
        self.setImage(UIImage(systemName: systemName), for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.setTitle("", for: .normal)
    }
    
    func configureButtonImage(name: String){
        self.setImage(UIImage(named: name), for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
        self.setTitle("", for: .normal)
    }
}
