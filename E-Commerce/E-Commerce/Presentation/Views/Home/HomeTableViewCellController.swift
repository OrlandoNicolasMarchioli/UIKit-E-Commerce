//
//  HomeTableViewCellController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 03/01/2024.
//

import UIKit

class HomeTableViewCellController: UIViewController {

    @IBOutlet var verticalTableView: UITableView!
    var names: [String] = ["Alpha","Beta","Unlimited","Revised"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verticalTableView.register(MyCellTableViewCell.self, forCellReuseIdentifier: "cell")

        verticalTableView.dataSource = self
        verticalTableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        verticalTableView.reloadData()
    }
}

extension HomeTableViewCellController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ verticalTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == verticalTableView {
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
