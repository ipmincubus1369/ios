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
    
    var countryList: [Country]
        
    // Initialization
    private init() {
        self.countryList = [Country]()
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
                    let country = Country(json: obj)
                    if (country != nil) {
                        self.countryList.append(country!)
                    }
                    
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
