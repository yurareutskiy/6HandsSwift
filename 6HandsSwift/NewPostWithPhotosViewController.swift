//
//  NewPostWithPhotosViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 11.09.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

protocol NewPostWithPhotosDelegate {
    func addPhoto()
    func deletePhoto(sender: UIButton)
}

class NewPostWithPhotosViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    var coor: AnyObject?
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var delegate = NewPostWithPhotosDelegate?()
    
    
    var test: Int = 4
    
    var photoArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionOriginPoint = collection.frame.origin.y
        let requriedCollectionSize = self.view.frame.height - collectionOriginPoint - 55
        collection.frame.size.height = requriedCollectionSize
        
//        do {
//            
//            try SwiftLocation.shared.currentLocation(Accuracy.Neighborhood, timeout: 20, onSuccess: { (location) -> Void in
//                //print("IM HERE!!!!!! \(location)")
//                let us = "\(location)"
//                let scanner = NSScanner(string:us)
//                var scanned: NSString?
//                
//                if scanner.scanUpToString("<", intoString: nil){
//                    scanner.scanString("<", intoString: nil)
//                    if scanner.scanUpToString(">", intoString: &scanned){
//                        let result: String = scanned as! String
//                        //print("IM HERE! \(result)")
//                        self.coor = result
//                        self.userDefaults.setObject(result, forKey: "coor")
//                        //let checka = self.userDefaults.valueForKey("coor")
//                        //print(checka!)
//                        //print(self.coor!)
//                    }
//                }
//                }) { (error) -> Void in
//                    
//            }
//        }
//        catch{
//            
//        }
        
        photoArray = [UIImage(named: "kvartira.jpg")!]

        
//        collection.delegate = self
//        collection.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func pressKrestButtonAction(sender: UIButton) {
        delegate?.deletePhoto(sender)
    }


    @IBAction func addPhotoAction(sender: AnyObject) {
        
        delegate?.addPhoto()
    }
    
    
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return photoArray.count + 1
//        return 30
//    }
//    
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        if (indexPath.row == 29) {
//            let cellPlus = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCellPlus", forIndexPath: indexPath) as! UICollectionViewCell
//            return cellPlus
//        }
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! CollectionViewCell
//        cell.image.layer.cornerRadius = 10
//        cell.image.clipsToBounds = true
//        cell.image.image = photoArray[0] as? UIImage
//        return cell
//    }

}
