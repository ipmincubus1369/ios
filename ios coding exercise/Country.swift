//
//  Country.swift
//  ios coding exercise
//
//  Created by Zhe Yu on 5/26/17.
//  Copyright © 2017 Zhe Yu. All rights reserved.
//

import Foundation

struct Country {
    
    let name: String?
    //let location: (latitude: Double, longitude: Double)
    //let topLevelDomain: [String]
    //let alpha2Code: String
    //let alpha3Code: String
    //let callingCodes: [String]
    let capital: String?
    let population: Int?
    let latlng: [Double]?


    init?(json: [String: Any]) {
        guard let name = json["name"] as? String else {return nil}
        guard let capital = json["capital"] as? String else {return nil}
        guard let population = json["population"] as? Int else {return nil}
        guard let latlng = json["latlng"] as? [Double] else {return nil}
        
        self.name = name
        self.capital = capital
        self.population = population
        self.latlng = latlng
        
    }
    
}
