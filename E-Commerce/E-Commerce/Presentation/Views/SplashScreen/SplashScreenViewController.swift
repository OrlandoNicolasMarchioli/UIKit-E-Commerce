//
//  SplashScreenViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 29/11/2023.
//

import Foundation
import UIKit

class SplashScreenViewController: UIViewController{
    private let splashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "SplashScreen")
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(splashImageView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.navigateToMainScreen()
        }
    }
    
    private func navigateToMainScreen() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController = mainStoryboard.instantiateInitialViewController() {
            UIApplication.shared.windows.first?.rootViewController = mainViewController
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
}
