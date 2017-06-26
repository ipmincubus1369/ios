//
//  DetailViewController.swift
//  ios coding exercise
//
//  Created by Zhe Yu on 5/26/17.
//  Copyright © 2017 Zhe Yu. All rights reserved.
//

import UIKit
import MapKit


class DetailViewController: UIViewController {
    var detailItem: Country!
    var areaSpan = CLLocationDegrees(30)
    
    override func loadView() {
        super.loadView()
        self.title = detailItem!.name
        
        let mapview = MKMapView()
        mapview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mapview)
        
        mapview.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        mapview.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        mapview.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor, constant: 0.0).isActive = true
        mapview.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.topAnchor).isActive = true

        addPinAndCenter(mapview: mapview)
        
    }
    
    func addPinAndCenter(mapview: MKMapView) {
        if (detailItem.latlng.first != nil && detailItem.latlng.last != nil) {
            let mapCenter = CLLocationCoordinate2DMake(detailItem.latlng.first!, detailItem.latlng.last!)
            let center = CountryAnnotation(title: detailItem.name, coordinate: mapCenter)
            mapview.addAnnotation(center)
            setAreaSpan()
            let span = MKCoordinateSpanMake(areaSpan, areaSpan)
            let region = MKCoordinateRegionMake(mapCenter, span)
            mapview.region = region
        }
    }
    
    func setAreaSpan () {
        switch detailItem.area {
        case 1..<10000:
            areaSpan = CLLocationDegrees(2)
        case 10000..<30000:
            areaSpan = CLLocationDegrees(20)
        case 30000..<40000:
            areaSpan = CLLocationDegrees(30)
        case 40000..<70000:
            areaSpan = CLLocationDegrees(40)
        default:
            areaSpan = CLLocationDegrees(55)
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
