//
//  MainTablesViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 05.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit


class MainTablesViewController: UIViewController, CAPSPageMenuDelegate, PopTableViewDelegate {

    var widthMenu: CGFloat?
    var widthView: CGFloat?
    var viewClear: UIView?
    var rightViewClear: UIView?
    
    var slider : CAPSPageMenu?
    
    var newVC: PopTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Menu
        
        
        widthMenu = 280
        widthView = view.frame.width - 280

        viewClear = UIView(frame: CGRectMake(widthMenu!, 0, widthView!, view.frame.height))
        viewClear!.backgroundColor = UIColor.clearColor()
        
        rightViewClear = UIView(frame: CGRectMake(0, 0, widthView!, view.frame.height))
        rightViewClear?.backgroundColor = UIColor.clearColor()
        
        let rightGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "closeMenu")
        viewClear!.addGestureRecognizer(rightGestureRecognizer)
        rightViewClear!.addGestureRecognizer(rightGestureRecognizer)
        
        navigationController?.navigationBar.addSubview(viewClear!)


        
        // Determine screen size
        
        let bounds = UIScreen.mainScreen().bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        
        // Navigation controller
            // Navigation bar view
        
        edgesForExtendedLayout = UIRectEdge.None
        
        
        let pageSliderMenuColor = UIColor(red: 243, green: 243, blue: 244, alpha: 1)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage.new(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.view.backgroundColor = pageSliderMenuColor
        navigationController?.navigationBar.shadowImage = UIImage.new()
        view.backgroundColor = pageSliderMenuColor
        
            // Custom navigation bar items
        
        let imgView = UIImageView(image: UIImage(named: "sixHandsLogo"))
        imgView.frame = CGRect(x: 75, y: 0, width: 80, height: 20)
        imgView.contentMode = UIViewContentMode.ScaleAspectFit
        navigationController?.navigationBar.topItem?.titleView = imgView
        
            // Custom RIGHT navigation bar button
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "kitchen pack18"), style: UIBarButtonItemStyle.Plain, target: nil, action: "revealFilterMenu")
        navigationItem.rightBarButtonItem = rightItem
        
            // Custom LEFT navigation bar button
        let leftItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: nil, action: "revealMenu:")
        navigationItem.leftBarButtonItem = leftItem
        
        // Page slider
        
        let rectSlider = CGRect(x: 0, y: 0, width: width, height: height - 40)
        
        
        newVC = storyboard?.instantiateViewControllerWithIdentifier("VC with Pop") as? PopTableViewController
        newVC!.delegate? = self
//        var newVC = storyboard?.instantiateViewControllerWithIdentifier("VC with Pop") as! PopTableViewController
        newVC!.title = "Новое"
        
        let popularVC = storyboard?.instantiateViewControllerWithIdentifier("VC with Pop") as! PopTableViewController
//        var popularVC: PopularTableViewController = PopularTableViewController(nibName: "PopularTableViewController", bundle: nil)

        popularVC.title = "Популярное"
        
        let arrayVC: [UIViewController] = [newVC!, popularVC]
        
        var parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .SelectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .MenuMargin(20.0),
            .MenuHeight(40.0),
            .SelectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .UnselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
//            .MenuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .UseMenuLikeSegmentedControl(true),
            .SelectionIndicatorHeight(2.0),
            .MenuItemSeparatorWidth(0),
        ]
                
        slider = CAPSPageMenu(viewControllers: arrayVC, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        slider!.delegate = self
        
        self.view.addSubview(slider!.view)
        
        // add clear view

        view.addSubview(viewClear!)
        view.addSubview(rightViewClear!)
        viewClear?.hidden = true
        
        
        var ncArray = navigationController?.viewControllers
        println(ncArray?.description)
        
//        performSegueWithIdentifier("toRoomPage", sender: self)

        
        
    }
    
    class func pushRoomPage() {
//        var ncArray = navigationController?.viewControllers
//        println(ncArray?.description)
//        navigationController?.pushViewController(<#viewController: UIViewController#>, animated: <#Bool#>)
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc: UIViewController! = sb.instantiateViewControllerWithIdentifier("vcTemp") as! UIViewController
//        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: self, cache: false)
//        presentViewController(vc, animated: true, completion: nil)
//        self.navigationController?.pushViewController(vc, animated: true)
//        println(navigationController?.viewControllers.description)
        
//        performSegueWithIdentifier("toRoomPage", sender: self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: CAPSPageMenuDelegate
    
    func didMoveToPage(controller: UIViewController, index: Int) {
        println("did move to page \(index) " + controller.description)

    }
    
    func willMoveToPage(controller: UIViewController, index: Int) {
        println("will move to page \(index) " + controller.description)
    }
    
    
    
    
    func setViewControllers() {
//        let arrayWithVC = Array()
        
    }
    
    func revealFilterMenu() {

        self.sideMenuController()?.rightSideMenu?.toggleMenu()
    
    }
    
    func revealMenu(sender: UIBarButtonItem) {
        
        self.sideMenuController()?.sideMenu?.toggleMenu()
    }
    
    
    
    func closeMenu() {
        
        if sideMenuController()?.sideMenu?.isMenuOpen == true {
        
            sideMenuController()?.sideMenu?.toggleMenu()

        } else if sideMenuController()?.rightSideMenu?.isMenuOpen == true {
            
            sideMenuController()?.rightSideMenu?.toggleMenu()
        }
        
        
    }
    
    func sideMenuWillOpen() {
        println("sideMenuWillOpen")
        
        println(widthView)
        println(widthMenu!)
        println(self.view.frame.width)
        
        
        viewClear?.hidden = false
        
        
        if self.sideMenuController()?.rightSideMenu?.isMenuOpen == true {

        
        }
        
    }
    
    func sideMenuWillClose() {
        println("sideMenuWillClose")
        
        viewClear?.hidden = true
        
    }
    func sideMenuShouldOpenSideMenu() -> Bool {
        println("sideMenuShouldOpenSideMenu")

        if (self.sideMenuController()?.sideMenu?.isMenuOpen == true) || (self.sideMenuController()?.rightSideMenu?.isMenuOpen == true) {
            
            return false
        }
        
        return true
    }
    

    
    func makeSegueToRoomPage() {
        
    
        var vc: RoomViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RoomPage") as! RoomViewController
        vc.forLog = "other"
        navigationController?.pushViewController(vc, animated: true)
    }

    func didSelect(text:String) {
        println(text)
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
