//
//  PostThirdViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 10.10.15.
//  Copyright © 2015 reutskiy. All rights reserved.
//

import UIKit
import CoreLocation
import AddressBookUI

class PostThirdViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var point:UIButton!
    @IBOutlet var check:UILabel!
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        point.layer.cornerRadius = 10.0
        locationManager.requestWhenInUseAuthorization()

        let coor = userDefaults.valueForKey("coor") as! String

        let components = coor.characters.split {$0 == ","}.map { String($0) }
        
        let firstCoor = (components[0] as NSString).doubleValue
        let secondCoor = (components[1] as NSString).doubleValue
        
        let coordinates = CLLocationCoordinate2DMake(firstCoor, secondCoor)
        SwiftLocation.shared.reverseCoordinates(Service.Apple, coordinates: coordinates, onSuccess: { (place) -> Void in
            // our placemark is here
            //self.check.text = ABCreateStringWithAddressDictionary((place?.addressDictionary)!, false)
            }) { (error) -> Void in
                // something went wrong
        }
        
        
        

        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    @IBAction func checkLoc(sender: AnyObject) {

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
