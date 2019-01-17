//
//  ViewController.swift
//  MapkitGeoCoder
//
//  Created by claudio Cavalli on 17/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var addressBar: UITextField!
   
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var userLocation: CLLocation?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupLocation()
        setupMap()
      

        
    }
    

    @IBAction func getDetails(_ sender: Any) {
        getcoord()
    }
    
    
}

