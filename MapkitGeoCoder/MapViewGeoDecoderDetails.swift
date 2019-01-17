//
//  MapViewGeoDecoderDetails.swift
//  MapkitGeoCoder
//
//  Created by claudio Cavalli on 17/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension MapViewController{
    
    func getcoord(){
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(addressBar.text!) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                
                let placemark = placemarks?.first
               
                if(placemark?.postalCode == nil){
                    print("not found")
                    return
                  }
                
                print("country: \(placemark!.country!), locality:  \(placemark!.locality!),country code: \(placemark!.isoCountryCode!),postal code: \(placemark!.postalCode!)")
                
                let anno = MKPointAnnotation()
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = self.addressBar.text!
                
                let span = MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075)
                let region = MKCoordinateRegion(center: anno.coordinate, span: span)
                if(self.mapView.annotations.count > 1 ){
                    self.mapView.removeAnnotations(self.mapView.annotations)
                }
                
                self.mapView.setRegion(region, animated: true)
                self.mapView.addAnnotation(anno)
                self.mapView.selectAnnotation(anno, animated: true)
                
            }else{
                print(error?.localizedDescription ?? "error")
            }
            
        }
        
    }
    
    
    
    func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: latitude, longitude: longitude)) { completion($0?.first, $1) }
    }
}
