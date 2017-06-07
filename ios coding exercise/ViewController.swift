//
//  ViewController.swift
//  ios coding exercise
//
//  Created by Zhe Yu on 5/16/17.
//  Copyright © 2017 Zhe Yu. All rights reserved.
//

import UIKit
import Foundation
import MapKit

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CountryManager.shared().fetchJSON{ () in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountryManager.shared().countryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = CountryManager.shared().countryList[indexPath.row]
        if let countryName: String = country.name {
            cell.textLabel?.text = countryName
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DetailViewController()
        vc.detailItem = CountryManager.shared().countryList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
