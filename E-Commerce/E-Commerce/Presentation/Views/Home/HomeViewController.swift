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
        
        horizontalTableView.register(MyCellTableViewCell.self, forCellReuseIdentifier: "cell")
        verticalTableView.register(MyCellTableViewCell.self, forCellReuseIdentifier: "cell")

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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == horizontalTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCellTableViewCell
            else { return UITableViewCell() }
            
            cell.titleLabel?.text = names[indexPath.row]
            cell.titleLabel?.textColor = .black
            cell.backgroundColor = UIColor.red
            return cell
            
        } else if tableView == verticalTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCellTableViewCell 
            else { return UITableViewCell() }
            
            cell.titleLabel?.text = names[indexPath.row]
            cell.titleLabel?.textColor = .black
            cell.backgroundColor = UIColor.blue
            return cell

        }
           
        return UITableViewCell()
    }
}
