//
//  MainNavigationViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 12.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class MainNavigationViewController: ENSideMenuNavigationController, ENSideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = ENSideMenu(sourceView: self.view, menuPosition:.Left)
        sideMenu?.menuWidth = 280.0
        
        rightSideMenu = ENSideMenu(sourceView: self.view, menuPosition: .Right)
        rightSideMenu?.menuWidth = 280.0
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
