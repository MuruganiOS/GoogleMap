//
//  ViewController.swift
//  GMS_API
//
//  Created by MURUGAN on 03/01/19.
//  Copyright © 2019 MURUGAN. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        self.mapView.isMyLocationEnabled = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locationManager.location?.coordinate
        
        cameraMoveToLocation(toLocation: location)
        
    }
    
    func cameraMoveToLocation(toLocation: CLLocationCoordinate2D?) {
        if toLocation != nil {
            mapView.camera = GMSCameraPosition.camera(withTarget: toLocation!, zoom: 15)
        }
    }
    
}

