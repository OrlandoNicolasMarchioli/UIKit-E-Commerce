//
//  ViewController.swift
//  E-Commerce
//
//  Created by Orlando Nicolas Marchioli on 28/11/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var strings: [String] = ["Alpha","Beta","Unlimited","Revised",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource? = self
    }
    
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    //What kind of cell you want to return
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = strings[indexPath.row]
        
        return cell
    }
    
    
}
