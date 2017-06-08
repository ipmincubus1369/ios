//
//  countryAnnotation.swift
//  ios coding exercise
//
//  Created by Zhe Yu on 6/8/17.
//  Copyright © 2017 Zhe Yu. All rights reserved.
//

import Foundation
import MapKit

class CountryAnnotation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
