//
//  MainTablesViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 05.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit


class MainTablesViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "kitchen pack18"), style: UIBarButtonItemStyle.Plain, target: nil, action: Selector("revealFilterMenu:"))
        navigationItem.rightBarButtonItem = rightItem
        
            // Custom LEFT navigation bar button
        let leftItem = UIBarButtonItem(image: UIImage(named: "menu"), style: UIBarButtonItemStyle.Plain, target: nil, action: "revealMenu:")
        navigationItem.leftBarButtonItem = leftItem
        
        // Page slider
        
        let rectSlider = CGRect(x: 0, y: 0, width: width, height: height - 40)
        
        let newVC = TableWithNewViewController.new()
        let popularVC = TableWithPopularViewController.new()
        
        let arrayVC = [newVC, popularVC]
                
        let slider = GFPageSlider(frame: rectSlider, numberOfPage: 2, viewControllers: NSMutableArray(array: arrayVC), menuButtonTitles: ["Популярное", "Новое"])
        
        slider.menuHeight = 45
        slider.menuNumberPerPage = 2
        slider.indicatorLineColor = UIColor(patternImage: UIImage(named: "blueColor")!)
        
        view.addSubview(slider)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setViewControllers() {
//        let arrayWithVC = Array()
        
    }
    
    func revealFilterMenu(sender: UIBarButtonItem) {

    
    }
    
    func revealMenu(sender: UIBarButtonItem) {
        
        
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
