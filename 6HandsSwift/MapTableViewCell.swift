//
//  MapTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 25.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class MapTableViewCell: UITableViewCell, MKMapViewDelegate, GMSMapViewDelegate {


    let baseURLGeocode = "https://maps.googleapis.com/maps/api/geocode/json?"
    
    var lookupAddressResults: Dictionary<NSObject, AnyObject>!
    
    var fetchedFormattedAddress: String!
    
    var fetchedAddressLongitude: Double!
    
    var fetchedAddressLatitude: Double!
    
    @IBOutlet weak var map: GMSMapView!
    var address: String?
    var station: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        map.delegate = self
        map.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        
    }

    func setContentFrameWithStationName(stationText:String?, AndAddress addressText: String?) {
        let width = self.frame.width
        
        var view = UIView(frame: CGRectMake(10, 90, width - 20, 70))
        view.backgroundColor = UIColor.whiteColor()
        view.alpha = 0.85
        
        var addresLabel = UILabel(frame: CGRectMake(10, 4, view.frame.width - 20, 40))
        addresLabel.font = UIFont(name: "Helvetica", size: 15)
        addresLabel.numberOfLines = 2
        addresLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        addresLabel.textColor = UIColor.blackColor()
        if addressText != nil {
            addresLabel.text = addressText
        } else {
            addresLabel.text = "Карамышесвская набережная"
        }
        //        addresLabel.sizeToFit()
        
        
        let stationView = UIImageView(image: UIImage(named: "frameForStationName")!)
        //        stationView.frame = CGRectMake(5, 15 + addresLabel.frame.height, CGFloat.max, 20)
        stationView.frame = CGRectMake(10, 50, 100, 17)
        
        //        view.addSubview(stationView)
        
        let colorStationView = UIView(frame: CGRectMake(3, 3, stationView.frame.height - 6, stationView.frame.height - 6))
        colorStationView.clipsToBounds = true
        colorStationView.layer.cornerRadius = colorStationView.frame.height / 2
        colorStationView.backgroundColor = UIColor.redColor()
        
        //        var nameStation = UILabel(frame: CGRectMake(10, 2, stationView.frame.width - 12, stationView.frame.height - 4))
        var nameStation = UILabel(frame: CGRectMake(20, 3, 100, 10))
        nameStation.font = UIFont(name: "Helvetica", size: 10)
        nameStation.textColor = UIColor.blackColor()
        nameStation.numberOfLines = 1
        addresLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        if let stationName = stationText {
            nameStation.text = stationName
        } else {
            nameStation.text = "Таганская"
        }
        nameStation.sizeToFit()
        
        stationView.frame = CGRectMake(10, 45, nameStation.frame.width + 30, 17)
        
        stationView.addSubview(colorStationView)
        stationView.addSubview(nameStation)
        
        view.addSubview(addresLabel)
        view.addSubview(stationView)
        
        self.addSubview(view)
    
        zoomInLookingUpPosition(addressText)
    
    }
    
    func zoomInLookingUpPosition(address: String!) {
    
        geocodeAddress(address, withCompletionHandler: { (status, success) -> Void in
            let camera: GMSCameraPosition = GMSCameraPosition.cameraWithLatitude(self.fetchedAddressLatitude!, longitude: self.fetchedAddressLongitude!, zoom: 10.0)
            self.map.camera = camera
            var cameraMoving = GMSCameraUpdate.scrollByX(0, y: 20)
            self.map.moveCamera(cameraMoving)
            
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: self.fetchedAddressLatitude, longitude: self.fetchedAddressLongitude))
            marker.map = self.map
            
        })
        
        

    }
    
    
    func geocodeAddress(address: String!, withCompletionHandler completionHandler: ((status: String, success: Bool) -> Void)) {
        if let lookupAddress = address {
            var geocodeURLString = baseURLGeocode + "address=" + lookupAddress
            geocodeURLString = geocodeURLString.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
            
            let geocodeURL = NSURL(string: geocodeURLString)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let geocodingResultsData = NSData(contentsOfURL: geocodeURL!)
                
                var error: NSError?
                let dictionary: Dictionary<NSObject, AnyObject> = NSJSONSerialization.JSONObjectWithData(geocodingResultsData!, options: NSJSONReadingOptions.MutableContainers, error: &error) as! Dictionary<NSObject, AnyObject>
                
                if (error != nil) {
                    println(error)
                    completionHandler(status: "", success: false)
                }
                else {
                    // Get the response status.
                    let status = dictionary["status"] as! String
                    
                    if status == "OK" {
                        let allResults = dictionary["results"] as! Array<Dictionary<NSObject, AnyObject>>
                        self.lookupAddressResults = allResults[0]
                        
                        // Keep the most important values.
                        self.fetchedFormattedAddress = self.lookupAddressResults["formatted_address"] as! String
                        let geometry = self.lookupAddressResults["geometry"]as!  Dictionary<NSObject, AnyObject>
                        self.fetchedAddressLongitude = ((geometry["location"] as! Dictionary<NSObject, AnyObject>)["lng"] as! NSNumber).doubleValue
                        self.fetchedAddressLatitude = ((geometry["location"] as! Dictionary<NSObject, AnyObject>)["lat"] as! NSNumber).doubleValue
                        
                        completionHandler(status: status, success: true)
                    }
                    else {
                        completionHandler(status: status, success: false)
                    }
                }
            })
        }
        else {
            completionHandler(status: "No valid address.", success: false)
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
