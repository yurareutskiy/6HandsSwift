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
        
        let leftVC = storyboard?.instantiateViewControllerWithIdentifier("LeftMenu") as! UIViewController

        let rightVC = storyboard?.instantiateViewControllerWithIdentifier("RightMenu") as! UIViewController

        
//        leftVC.view.frame = CGRectMake(0, 0, leftVC.view.frame.size.width - 100, leftVC.view.frame.size.height)
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: leftVC, menuPosition: .Left)
        sideMenu?.menuWidth = 280.0
        
        rightSideMenu = ENSideMenu(sourceView: self.view, menuViewController: rightVC, menuPosition: .Right)
        rightSideMenu?.menuWidth = 280.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pushController(controller:UIViewController, withTransition transition:UIViewAnimationTransition) {
        UIView.beginAnimations("", context: nil)
        self.pushViewController(controller, animated: false)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationTransition(transition, forView: self.view, cache: true)
        UIView.commitAnimations()
    }
    /*
    - (void) pushController: (UIViewController*) controller
    withTransition: (UIViewAnimationTransition) transition
    {
    [UIView beginAnimations:nil context:NULL];
    [self pushViewController:controller animated:NO];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

*/
}