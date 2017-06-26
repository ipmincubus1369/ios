//
//  Country.swift
//  ios coding exercise
//
//  Created by Zhe Yu on 5/26/17.
//  Copyright © 2017 Zhe Yu. All rights reserved.
//

import Foundation

struct Country {
    
    let name: String
    let capital: String?
    let population: Int?
    let latlng: [Double]
    let area: Int


    init?(json: [String: Any]) {
        guard let name = json["name"] as? String else {return nil}
        let capital = json["capital"] as? String
        let population = json["population"] as? Int
        guard let latlng = json["latlng"] as? [Double] else {return nil}
        
        self.name = name
        self.capital = capital
        self.population = population
        self.latlng = latlng
        self.area = (json["area"] as? Int) ?? 60000
        
    }
    
}
