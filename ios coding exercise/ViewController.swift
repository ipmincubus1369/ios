//
//  ViewController.swift
//  ios coding exercise
//
//  Created by Zhe Yu on 5/16/17.
//  Copyright © 2017 Zhe Yu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController {
    //var global = [Any]()
    var countryList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchJSON()
    }
    
    func fetchJSON () {
        //let url = "https://restcountries-v1.p.mashape.com/all"
        let todoEndpoint: String = "https://restcountries-v1.p.mashape.com/all"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("1IosQYQKu0mshuIZjcqiIXbiLGJSp1dBB9Yjsnfd2aISWLA7Yk", forHTTPHeaderField: "X-Mashape-Key")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, response, error in
            // do stuff with response, data & error here
            if error != nil {
                print("error calling GET api")
                print(error!)
                return
            }
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }

            let json = try? JSONSerialization.jsonObject(with: responseData, options: [])
            if let array = json as? [Any] {
                for object in array {
                    // access all objects in array
                    guard let obj = object as? [String: Any] else {
                        return
                    }
                    guard let name = obj["name"] as? String else {
                        return
                    }
                    self.countryList.append(name)
                    Country(json: obj)
                }
            }
             self.tableView.reloadData()
        }
        task.resume()
        
    }
    
    struct Country {
        
        let name: String
        //let location: (latitude: Double, longitude: Double)
        //let topLevelDomain: [String]
        //let alpha2Code: String
        //let alpha3Code: String
        //let callingCodes: [String]
        //let capital: String
        //let altSpellings: [String]
        //let relevance: String
        //let region: String
        //let subregion: String
        //let population: String
        init?(json: [String: Any]) {
            guard let name = json["name"] as? String
            else {
                return nil
            }
            self.name = name
        }
       
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = countryList[indexPath.row]
            cell.textLabel?.text = name
    
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

