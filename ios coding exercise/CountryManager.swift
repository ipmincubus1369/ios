//
//  CountryManager.swift
//  ios coding exercise
//
//  Created by Zhe Yu on 5/25/17.
//  Copyright © 2017 Zhe Yu. All rights reserved.
//

import Foundation

class CountryManager {
    
    
    private static var sharedCountryManager: CountryManager = {
        let cm = CountryManager()
        return cm
    }()
    
    var countryList: [String]
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
    
    // Initialization
    private init() {
        self.countryList = [String]()
    }
    
    func fetchJSON (completionClosure: @escaping () -> ()) {
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
            completionClosure()
        }
        task.resume()
        
    }
    
    class func shared() -> CountryManager {
        return sharedCountryManager
    }
    
}
