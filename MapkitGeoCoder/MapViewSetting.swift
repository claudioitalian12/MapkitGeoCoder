//
//  MapViewSetting.swift
//  MapkitGeoCoder
//
//  Created by claudio Cavalli on 17/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension MapViewController{
    
    
    func setupLocation(){
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    func setupMap(){
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
    }
    
    
}
