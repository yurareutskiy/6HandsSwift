//
//  MainTablesViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 05.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit


class MainTablesViewController: UIViewController, ENSideMenuDelegate {

    var widthMenu: CGFloat?
    var widthView: CGFloat?
    var viewClear: UIView?
    var rightViewClear: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Menu
        
        self.sideMenuController()?.sideMenu?.delegate = self
        self.sideMenuController()?.rightSideMenu?.delegate = self
        
        widthMenu = sideMenuController()?.sideMenu?.menuWidth
        widthView = view.frame.width - widthMenu!

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
        
        let newVC = self.storyboard?.instantiateViewControllerWithIdentifier("VC with New") as! UIViewController
        let popularVC = self.storyboard?.instantiateViewControllerWithIdentifier("VC with Popular") as! UIViewController
        
        let arrayVC = [newVC, popularVC]
                
        let slider = GFPageSlider(frame: rectSlider, numberOfPage: 2, viewControllers: NSMutableArray(array: arrayVC), menuButtonTitles: ["Popular", "New"])
        
        slider.menuHeight = 45
        slider.menuNumberPerPage = 2
        slider.indicatorLineColor = UIColor(patternImage: UIImage(named: "blueColor")!)
        
        view.addSubview(slider)
        
        // add clear view
        view.addSubview(viewClear!)
        view.addSubview(rightViewClear!)
        viewClear?.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
