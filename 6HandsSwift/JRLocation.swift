//
//  JRLocation.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 10/29/15.
//  Copyright © 2015 reutskiy. All rights reserved.
//

import UIKit
import CoreLocation

class JRLocation: CLLocationManager, CLLocationManagerDelegate {
    
    enum JRLocationError: ErrorType {
        case IncorrectWork
    }

    let locationManager = CLLocationManager()

    func getAddressByLocation() {
    
        locationManager.delegate = self

        locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError")
        print(error)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        print(locations)
    }
    
    func getLocation() throws -> CLLocationCoordinate2D {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let coor = locationManager.location?.coordinate
        guard let result: CLLocationCoordinate2D = coor else {
            throw JRLocationError.IncorrectWork
        }
        return result
    }
}
