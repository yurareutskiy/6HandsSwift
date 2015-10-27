//
//  MainTablesViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 05.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit


class MainTablesViewController: UIViewController, CAPSPageMenuDelegate, PopTableViewDelegate, New2TableViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var widthMenu: CGFloat?
    var widthView: CGFloat?
    var viewClear: UIView?
    var rightViewClear: UIView?
    
    var rightItem: UIBarButtonItem?
    var leftItem: UIBarButtonItem?
    
    var slider : CAPSPageMenu?
    
    var newVC: PopTableViewController?
    var popularVC: New2TableViewController?
    var oneMoreVC: PopTableViewController?
    
        
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
        
        // add clear view
        
        view.addSubview(viewClear!)
        view.addSubview(rightViewClear!)
        viewClear?.hidden = true

        
        // Determine screen size
        
        let bounds = UIScreen.mainScreen().bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        
        // Navigation controller
            // Navigation bar view
        
//        edgesForExtendedLayout = UIRectEdge.None
        
        
        let pageSliderMenuColor = UIColor(red: 243, green: 243, blue: 244, alpha: 1)
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.view.backgroundColor = pageSliderMenuColor
        navigationController?.navigationBar.shadowImage = UIImage()
        view.backgroundColor = pageSliderMenuColor
        
            // Custom navigation bar items
        
        let imgView = UIImageView(image: UIImage(named: "sixHandsLogo"))
        imgView.frame = CGRect(x: 75, y: 0, width: 80, height: 20)
        imgView.contentMode = UIViewContentMode.ScaleAspectFit
        navigationController?.navigationBar.topItem?.titleView = imgView
        
            // Custom RIGHT navigation bar button
        
        rightItem = UIBarButtonItem(image: UIImage(named: "kitchen pack18"), style: UIBarButtonItemStyle.Plain, target: nil, action: "revealFilterMenu")
//        navigationItem.rightBarButtonItem = rightItem
        
            // Custom LEFT navigation bar button
        leftItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: nil, action: "revealMenu")
        //navigationItem.leftBarButtonItem = leftItem
        
        // Page slider
        
        let rectSlider = CGRect(x: 0, y: 0, width: width, height: height)
        
        var arrayVC: [UIViewController] = []
        
        newVC = storyboard?.instantiateViewControllerWithIdentifier("VC with Pop") as? PopTableViewController
        newVC!.delegate? = self
        newVC?.title = "Популярное"
        arrayVC.append(newVC!)
        
        popularVC = storyboard?.instantiateViewControllerWithIdentifier("VC with New") as? New2TableViewController
        popularVC!.delegate? = self
        popularVC?.title = "Новое"
        arrayVC.append(popularVC!)
        
        
//        oneMoreVC = storyboard?.instantiateViewControllerWithIdentifier("VC with Pop") as? PopTableViewController
//        oneMoreVC!.delegate? = self
//        arrayVC.append(oneMoreVC!)
        
//        let controller1 = PopTableViewController()
//        controller1.title = "Новое"
//        arrayVC.append(controller1)
//        
//        let controller2 = New2TableViewController()
//        controller2.title = "Популярное"
//        arrayVC.append(controller2)
        
        let parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
            .ViewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
            .BottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .SelectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .MenuMargin(0.0),
            .MenuHeight(40.0),
            .SelectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .UnselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
//            .MenuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
            .UseMenuLikeSegmentedControl(true),
            .SelectionIndicatorHeight(2.0),
            .MenuItemSeparatorWidth(0),
            .HideTopMenuBar(false),
        ]
    
        
        slider = CAPSPageMenu(viewControllers: arrayVC, frame: rectSlider, pageMenuOptions: parameters)
        slider!.delegate = self
        
        
        self.view.addSubview(slider!.view)

        
//        // Array to keep track of controllers in page menu
//        var controllerArray : [UIViewController] = []
//
//        
//        popularVC = storyboard?.instantiateViewControllerWithIdentifier("VC with New") as? New2TableViewController
//        popularVC?.tableView.delegate = self
//        popularVC?.tableView.dataSource = self
//        controllerArray.append(popularVC!)
//        
//        newVC = storyboard?.instantiateViewControllerWithIdentifier("VC with Pop") as? PopTableViewController
//        newVC?.tableView.delegate = self
//        newVC?.tableView.dataSource = self
//        controllerArray.append(newVC!)
//        
//        
//        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
//        // УчфьздуЖ
//        
//        let parameters: [CAPSPageMenuOption] = [
//            .ScrollMenuBackgroundColor(UIColor.whiteColor()),
//            .ViewBackgroundColor(UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)),
//            .BottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
//            .SelectionIndicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
//            .MenuMargin(20.0),
//            .MenuHeight(40.0),
//            .SelectedMenuItemLabelColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
//            .UnselectedMenuItemLabelColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
//            .MenuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 14.0)!),
//            .UseMenuLikeSegmentedControl(true),
//            .SelectionIndicatorHeight(2.0),
//            .MenuItemSeparatorWidth(0),
//        ]
//    
//        
//        // Initialize page menu with controller array, frame, and optional parameters
//        slider = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 40.0, self.view.frame.width, self.view.frame.height - 40), pageMenuOptions: parameters)
//        
//        // Lastly add page menu as subview of base view controller view
//        // or use pageMenu controller in you view hierachy as desired
//        self.view.addSubview(slider!.view)


        
        
//        self.navigationController?.addChildViewController(popularVC!)
//        self.navigationController?.addChildViewController(newVC!)
        
        self.navigationController?.addChildViewController(slider!)
        

        
         //performSegueWithIdentifier("toRoomPage", sender: self)
        
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
        print("did move to page \(index) " + controller.description)

    }
    
    func willMoveToPage(controller: UIViewController, index: Int) {
        print("will move to page \(index) " + controller.description)
    }
    
    func barButtonPressedAction(sender: UIBarButtonItem) {
        
    }
    
    
    func setViewControllers() {
//        let arrayWithVC = Array()
        
    }
    
    func revealFilterMenu() {

        //ВОТ ТУТ ЗАБЛОКИРОВАТЬ ВЗАИМОДЕЙСТВИЕ С ТАБЛИЦЕЙ И СЛАЙДЕРОМ
        
    
        self.sideMenuController()?.rightSideMenu?.toggleMenu()
    
    }
    
    func revealMenu() {
        
        //ВОТ ТУТ ЗАБЛОКИРОВАТЬ ВЗАИМОДЕЙСТВИЕ С ТАБЛИЦЕЙ И СЛАЙДЕРОМ
        
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
        print("sideMenuWillOpen")
        
        print(widthView)
        print(widthMenu!)
        print(self.view.frame.width)
        
        
        viewClear?.hidden = false
        
        
        if self.sideMenuController()?.rightSideMenu?.isMenuOpen == true {

        
        }
        
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
        
        viewClear?.hidden = true
        
    }
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")

        if (self.sideMenuController()?.sideMenu?.isMenuOpen == true) || (self.sideMenuController()?.rightSideMenu?.isMenuOpen == true) {
            
            return false
        }
        
        return true
    }
    

    
    func makeSegueToRoomPage() {
        
        print("im here")
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let vc: UIViewController! = sb.instantiateViewControllerWithIdentifier("RoomPage")
//        self.showDetailViewController(vc, sender: nil)
        
        //self.showViewController(vc, sender: nil)
        
        let vc: UIViewController! = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RoomPage") as! RoomViewController
        //vc.forLog = "other"
        self.showViewController(vc, sender: nil)
        //navigationController?.pushViewController(vc, animated: true)
    }

    func didSelect(text:String) {
        print(text)
        performSegueWithIdentifier("toRoomPage", sender: nil)
    }
    
    @IBAction func filterPressed(sender: UIBarButtonItem) {
        
        let addView: UIView = UIView.init(frame: self.view.frame)
        addView.userInteractionEnabled = false
        //addView.backgroundColor = UIColor.blackColor()
        popularVC?.view.addSubview(addView)
        newVC?.view.addSubview(addView)
        print("here")
        
        view.userInteractionEnabled = false
        self.sideMenuController()?.rightSideMenu?.toggleMenu()
        
    }
    
    @IBAction func menuPressed(sender: UIBarButtonItem){
        
        let addView: UIView = UIView.init(frame: self.view.frame)
        addView.userInteractionEnabled = false
        //addView.backgroundColor = UIColor.blackColor()
        popularVC?.view.addSubview(addView)
        newVC?.view.addSubview(addView)
        print("here")
        
        view.userInteractionEnabled = false
        self.sideMenuController()?.sideMenu?.toggleMenu()
        
    }
    
    
    
    
    
    
    
    
    // MARK: - TABLE VIEW
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : SimpleTableViewCell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! SimpleTableViewCell
        
        //        let cell : SimpleTableViewCell = SimpleTableViewCell.init()
        
        //        cell.awakeFromNib()
        
        //        configure(cell, forRowAtIndexPath: indexPath)
        
        cell.someTextLabel!.text = "Карамышевская набережная, 56к2"
        cell.numerLabel!.text = NSString(format: "%d", indexPath.row + 1) as String
        cell.priceLabel!.text = formattedStringWithPrice("100000")
        cell.roomSquareLabel!.text = "123 м²"
        
        if indexPath.row % 3 == 0 {
            cell.yellowCorner.hidden = false
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundCellView.backgroundColor = UIColor.whiteColor()
        } else {
            cell.backgroundCellView.backgroundColor = UIColor(patternImage: UIImage(named: "greenBackForCell")!)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //        let vc = MainTablesViewController()
        //        vc.performSegueWithIdentifier("toRoomPage", sender: self)
        //        let vc = MainTablesViewController()
        //        vc.toPageMenu()
        
        performSegueWithIdentifier("toRoomPage", sender: self)
        
    }
    
    func configure(cell: SimpleTableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.someTextLabel!.text = "Карамышевская набережная, 56к2"
        cell.numerLabel!.text = NSString(format: "%d", indexPath.row + 1) as String
        cell.priceLabel!.text = formattedStringWithPrice("100000")
        cell.roomSquareLabel!.text = "123 м²"
        
        if indexPath.row % 3 == 0 {
            cell.yellowCorner.hidden = false
        }
        cell.colorStationView.backgroundColor = SubwayLine.Purple.Color
        if indexPath.row % 2 == 0 {
            cell.backgroundCellView.backgroundColor = UIColor.whiteColor()
        } else {
            cell.backgroundCellView.backgroundColor = UIColor(patternImage: UIImage(named: "greenBackForCell")!)
        }
    }
    
    
    func formattedStringWithPrice(price: String) -> String {
        var lenghtString = price.characters.count
        var resultString: String = ""
        for char in price.characters {
            if (lenghtString % 3 == 0) && (price.characters.count != lenghtString) {
                resultString += " "
            }
            resultString += String(char)
            lenghtString -= 1
        }
        return resultString
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
