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
