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
}

class NewPostWithPhotosViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    var delegate = NewPostWithPhotosDelegate?()
    
    
    var test: Int = 4
    
    var photoArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        photoArray = [UIImage(named: "kvartira.jpg")!]

        
//        collection.delegate = self
//        collection.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func pressKrestButtonAction(sender: UIButton) {
        print(":3")
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
