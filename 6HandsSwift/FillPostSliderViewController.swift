//
//  FillPostSliderViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 08.09.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit
import CoreLocation

class FillPostSliderViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NewPostWithPhotosDelegate {
    
    enum JRLocationError: ErrorType {
        case IncorrectWork
    }

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    
    var secondVC: PostSecondViewController?
    var firstVC: NewPostWithPhotosViewController?
    var thirdVC: PostThirdViewController?
    
    @IBOutlet weak var arrowBackButton: UIButton!
    var photoArray: NSMutableArray = []
    var indexPage: Int = 0
    
    var collection: UICollectionView!
    let locationManager = CLLocationManager()

    
    let offsetTopScroll: CGFloat = 50
    let scrollAnimationDuration: CGFloat = 350
    
    var index = 0
    var coor = CLLocationCoordinate2D()

    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        
        photoArray = []

        scroll.frame = self.view.frame
        
        attributesForStepLabel()
        
        firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FirstPostVC") as! NewPostWithPhotosViewController
        firstVC!.view.frame.size.height = self.view.frame.height - 105
        firstVC!.view.frame.origin.y = offsetTopScroll
        firstVC!.view.frame.size.width = self.view.frame.width
        firstVC!.delegate = self
        navigationController?.navigationBarHidden = true
        
        collection = firstVC!.collection
        collection.delegate = self
        collection.dataSource = self
        
//        collection.frame.size.height = 200
        
        scroll.addSubview(firstVC!.view)
        
        secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SecondPostVC") as! PostSecondViewController
        
        secondVC!.view.frame.size.height = self.view.frame.height - 105
        secondVC!.view.frame.origin.y = offsetTopScroll
        secondVC!.view.frame.size.width = self.view.frame.width
        
        thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ThirdVC") as! PostThirdViewController
        
//        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            do {
                locationManager.requestWhenInUseAuthorization()
                locationManager.startUpdatingLocation()
                let coordinates = locationManager.location?.coordinate
                print(coordinates)
                self.coor = try self.getLocation()
            } catch {
                print("Location isn't determined")
            }
//        }
        
        secondVC!.view.frame.origin = CGPointMake(self.view.frame.width, offsetTopScroll)
        thirdVC!.view.frame.origin = CGPointMake(self.view.frame.width * 2, offsetTopScroll)
        
        scroll.addSubview(secondVC!.view)
        scroll.addSubview(thirdVC!.view)
        
        arrowBackButton.hidden = true
        

        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        for field in secondVC!.fields {
            field.delegate = self
        }

        if (self.view.frame.height == 480) {
            collection.frame.size.height = 190
        }

    }

    
    func getLocation() throws -> CLLocationCoordinate2D {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        let coor = locationManager.location?.coordinate
        print(coor)
        guard let result: CLLocationCoordinate2D = coor else {
            throw JRLocationError.IncorrectWork
        }
        return result
    }

    func addPhoto() {
        let alertVC = UIAlertController(title: "Загрузка фотографии", message: "Выберете способ загрузки фотографии", preferredStyle: .ActionSheet)
        let libraryAction = UIAlertAction(title: "Выбрать уже сделанную", style: .Default) { (UIAlertAction) -> Void in
            self.picker.allowsEditing = false
            self.picker.sourceType = .PhotoLibrary
            self.picker.modalPresentationStyle = .Popover
            self.presentViewController(self.picker, animated: true, completion: nil)
        }
        let photoAction = UIAlertAction(title: "Сделать фото", style: .Default, handler: { (UIAlertAction) -> Void in
            if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
                self.picker.allowsEditing = false
                self.picker.sourceType = .Camera
                self.picker.cameraCaptureMode = .Photo
                self.presentViewController(self.picker, animated: true, completion: nil)
            }
        })
        alertVC.addAction(photoAction)
        alertVC.addAction(libraryAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    func deletePhoto(sender: UIButton) {
        photoArray.removeObjectAtIndex(sender.tag)
        self.collection.reloadData()
    }
    
    
    // MARK: Photo Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let chosenPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoArray.addObject(chosenPhoto)
        collection.reloadData()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//        view.endEditing(true)
//        super.touchesBegan(touches, withEvent: event)
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        return photoArray.count + 1
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if (indexPath.row == photoArray.count) {
            let cellPlus = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCellPlus", forIndexPath: indexPath) 
            return cellPlus
        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.image.layer.cornerRadius = 10
        cell.image.clipsToBounds = true
        cell.image.image = photoArray[indexPath.row] as? UIImage
        cell.closeButton.tag = indexPath.row
        
        return cell
    }
    
    @IBAction func backButtonAction(sender: AnyObject) {
    
        if index != 1{
            nextButton.setTitle("далее", forState: UIControlState.Normal)
            nextButton.imageEdgeInsets.right = -77.0
        }
        
        let duration : Double = Double(scrollAnimationDuration) / Double(1000)
        
        UIView.animateWithDuration(duration) { () -> Void in
        }
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.index--
            let xOffset : CGFloat = CGFloat(self.index) * self.view.frame.width
            self.scroll.setContentOffset(CGPoint(x: xOffset, y: self.scroll.contentOffset.y), animated: false)
            self.arrowBackButton.hidden = false
            
        })
        
        if index == 0{
            self.arrowBackButton.hidden = true
        }
    
        switch index {
        case 0: stepLabel.text = "ШАГ 1 ИЗ 3"
        case 1: stepLabel.text = "ШАГ 2 ИЗ 3"
        case 2: stepLabel.text = "ШАГ 3 ИЗ 3"
        default: stepLabel.text = ""
        }
        attributesForStepLabel()
    }
    
    @IBAction func dismissAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func nextButtonAction(sender: UIButton) {
        
        
        if index >= 2 {
            
            let alert = UIAlertView(title: "Квартира сдается", message: "Теперь можно продолжить пользоваться нашим приложением", delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "OK")
            alert.show()
            
            performSegueWithIdentifier("finish", sender: self)
            return
        } else if index == 1{
            nextButton.setTitle("закончить регистрацию", forState: UIControlState.Normal)
            nextButton.imageEdgeInsets.right = -225.0
        }
        
        let duration : Double = Double(scrollAnimationDuration) / Double(1000)
        
        UIView.animateWithDuration(duration) { () -> Void in
        }
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.index++
            let xOffset : CGFloat = CGFloat(self.index) * self.view.frame.width
            self.scroll.setContentOffset(CGPoint(x: xOffset, y: self.scroll.contentOffset.y), animated: false)
            self.arrowBackButton.hidden = false

        })
        
        switch index {
        case 0: stepLabel.text = "ШАГ 1 ИЗ 3"
        case 1: stepLabel.text = "ШАГ 2 ИЗ 3"
        case 2: stepLabel.text = "ШАГ 3 ИЗ 3"
        default: stepLabel.text = ""
        }
        attributesForStepLabel()
    }
    
    @IBAction func backAction(sender: UIButton) {
        if index == 1 {
            arrowBackButton.hidden = true
        }
        
        
    }
}



