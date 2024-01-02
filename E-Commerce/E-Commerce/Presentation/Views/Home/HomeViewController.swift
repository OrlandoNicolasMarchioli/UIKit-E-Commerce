//
//  ViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 28/11/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var horizontalTableView: UITableView!
    @IBOutlet var verticalTableView: UITableView!
    var names: [String] = ["Alpha","Beta","Unlimited","Revised"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        horizontalTableView.dataSource = self
        horizontalTableView.delegate = self
        verticalTableView.dataSource = self
        verticalTableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        verticalTableView.reloadData()
        horizontalTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ horizontalTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    //What kind of cell you want to return
    func tableView(_ verticalTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = verticalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCellTableViewCell{
            cell.titleLabel?.text = names[indexPath.row]
            cell.titleLabel?.textColor = .black
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ horizontalTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    //What kind of cell you want to return
    func tableView(_ horizontalTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = horizontalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCellTableViewCell{
            cell.titleLabel?.text = names[indexPath.row]
            cell.titleLabel?.textColor = .black
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    
}
