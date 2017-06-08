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
    
    override func loadView() {
        super.loadView()
        self.title = detailItem?.name
        
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
            let center = CountryAnnotation(title: detailItem.name, coordinate: CLLocationCoordinate2D(latitude: detailItem.latlng.first!, longitude: detailItem.latlng.last!))
            mapview.addAnnotation(center)
            let span = MKCoordinateSpanMake(30, 30)
            let region = MKCoordinateRegionMake(mapCenter, span)
            mapview.region = region
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
