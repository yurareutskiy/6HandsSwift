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

        let bounds = UIScreen.mainScreen().bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        
        edgesForExtendedLayout = UIRectEdge.None
        
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//        self.navigationController.view.backgroundColor = pageSliderMenuColor;
//        self.navigationController.navigationBar.shadowImage = [UIImage new];
//        self.view.backgroundColor = pageSliderMenuColor;
        
        let pageSliderMenuColor = UIColor(red: 243, green: 243, blue: 244, alpha: 1)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage.new(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.view.backgroundColor = pageSliderMenuColor
        navigationController?.navigationBar.shadowImage = UIImage.new()
        view.backgroundColor = pageSliderMenuColor
        
    
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
