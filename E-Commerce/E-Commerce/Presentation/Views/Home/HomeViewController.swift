//
//  ViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 28/11/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet var starButton: UIButton!
    @IBOutlet var cartButton: UIButton!
    @IBOutlet var horizontalTableView: UICollectionView!
    @IBOutlet var verticalTableView: UITableView!
    let verticalCellSpacing: CGFloat = 70.0
    let collectionViewLayout = MyCellCollectionViewCellLayout()
    
    var products: [Product] = [Product(image: "vino", name: "Vino toro", type: "bebidas", price: 2500.0),Product(image: "aceituna", name: "Aceitunas sin carozo", type: "frutas", price: 1000.0),Product(image: "cervezaCorona", name: "Cerveza corona 300cc", type: "bebidas", price: 2500),Product(image: "quesoFresco", name: "Queso fresco ", type: "quesos", price: 5460.0),Product(image: "LecheEnteraLaSerenisima", name: "Leche entera 1L", type: "bebidas s/ alcohol", price: 1500),Product(image: "anana", name: "Anana", type: "frutas", price: 750)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        let collectionNib = UINib(nibName: "MyCellCollectionViewCell", bundle: nil)
        horizontalTableView.collectionViewLayout = collectionViewLayout
        verticalTableView.register(nib, forCellReuseIdentifier: "cell")
        horizontalTableView.register(collectionNib, forCellWithReuseIdentifier: "collectionCell")
        
        horizontalTableView.dataSource = self
        horizontalTableView.delegate = self
        verticalTableView.dataSource = self
        verticalTableView.delegate = self
        
        
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.setTitle("", for: .normal)
        cartButton.imageView?.contentMode = .scaleAspectFit
        cartButton.layer.cornerRadius = 10
        
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.setTitle("", for: .normal)
        starButton.imageView?.contentMode = .scaleAspectFit
        starButton.imageView?.tintColor = UIColor.white
        starButton.layer.cornerRadius = 10
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        verticalTableView.reloadData()
        horizontalTableView.reloadData()
    }
    
    //    @IBAction func didCartTapButton(_ sender: Any) {
    //        let storyboard = UIStoryboard(name: "CartViewController", bundle: nil)
    //        let cartController = storyboard.instantiateViewController(withIdentifier: "CartViewController" ) as! CartViewController
    ////        cartController.productsToBuy = products
    //        self.present(cartController, animated: true, completion: nil)
    //        print("Button pressed")
    //    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ horizontalTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    //What kind of cell you want to return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = products[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        
        cell.configure(product: product)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  verticalCellSpacing
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return verticalCellSpacing
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.product = selectedProduct
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = products[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? MyCellCollectionViewCell
        else {return UICollectionViewCell()}
        
        cell.configure(product: product)
        return cell
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: view.frame.width , height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.product = selectedProduct
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
}
