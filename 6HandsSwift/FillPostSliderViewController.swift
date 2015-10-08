//
//  FillPostSliderViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 08.09.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class FillPostSliderViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var arrowBackButton: UIButton!
    var photoArray = []
    
    var collection: UICollectionView!
    
    let offsetTopScroll: CGFloat = 50
    let scrollAnimationDuration: CGFloat = 350
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoArray = [UIImage(named: "kvartira.jpg")!, UIImage(named: "kvartira2.jpg")!]

        
        attributesForStepLabel()
        
        let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FirstPostVC") as! NewPostWithPhotosViewController
        firstVC.view.frame.size.height = self.view.frame.height - 105
        firstVC.view.frame.origin.y = offsetTopScroll
        navigationController?.navigationBarHidden = true
        
        collection = firstVC.collection
        collection.delegate = self
        collection.dataSource = self
        
        collection.frame.size.height = 200
        
        scroll.addSubview(firstVC.view)
        
        
        var secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SecondPostVC") as! PostSecondViewController
        
        secondVC.view.frame.origin = CGPointMake(self.view.frame.width, offsetTopScroll)
        scroll.addSubview(secondVC.view)
        
        arrowBackButton.hidden = true
        
        
//        vc.button.addTarget(self, action: "testFunc", forControlEvents: UIControlEvents.TouchUpInside)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func addPhoto() {
        print("Test")
    }
    

    func testFunc() {
        print("<3")
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func attributesForStepLabel() {
        var text = NSMutableAttributedString(attributedString: stepLabel.attributedText!)
        text.addAttribute(NSForegroundColorAttributeName, value: UIColor(patternImage: UIImage(named: "blueColor")!), range: NSMakeRange(4, 1))
        stepLabel.attributedText = text
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return photoArray.count + 1
        return 20
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if (indexPath.row == 19) {
            let cellPlus = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCellPlus", forIndexPath: indexPath) 
            return cellPlus
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.image.layer.cornerRadius = 10
        cell.image.clipsToBounds = true
        cell.image.image = photoArray[0] as? UIImage
        return cell
    }
    @IBAction func backButtonAction(sender: AnyObject) {
    }
    
    @IBAction func dismissAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func nextButtonAction(sender: UIButton) {

        let duration : Double = Double(scrollAnimationDuration) / Double(1000)
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.index++
            let xOffset : CGFloat = CGFloat(self.index) * self.scroll.frame.width
            self.scroll.setContentOffset(CGPoint(x: xOffset, y: self.scroll.contentOffset.y), animated: false)
        })
    }
    
}



