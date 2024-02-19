//
//  ViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 28/11/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var horizontalTableView: UICollectionView!
    @IBOutlet weak var verticalTableView: UITableView!

    let verticalCellSpacing: CGFloat = 70.0
    let collectionViewLayout = MyCellCollectionViewCellLayout()
    
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
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ horizontalTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductsRepository.shared.getProducts().count
    }
    
    //What kind of cell you want to return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = ProductsRepository.shared.getProducts()[indexPath.row]
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
        let selectedProduct = ProductsRepository.shared.getProducts()[indexPath.row]
        
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.product = selectedProduct
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProductsRepository.shared.getProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let product = ProductsRepository.shared.getProducts()[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? MyCellCollectionViewCell
        else {return UICollectionViewCell()}
        
        cell.configure(product: product)
        return cell
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: view.frame.width , height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedProduct = ProductsRepository.shared.getProducts()[indexPath.row]
        
        let detailVC = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.product = selectedProduct
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
