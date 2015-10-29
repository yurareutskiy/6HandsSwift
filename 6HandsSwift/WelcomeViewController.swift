//
//  WelcomeViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 05.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit


class WelcomeViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    
    @IBOutlet var findRoomButton: UIButton!
    @IBOutlet var rentRoomButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        findRoomButton.layer.cornerRadius = 10.0
        rentRoomButton.layer.cornerRadius = 10.0
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rentRoomAction(sender: UIButton) {
//        // Get view controllers and build the walkthrough
//        let stb = UIStoryboard(name: "Main", bundle: nil)
//        let walkthrough = stb.instantiateViewControllerWithIdentifier("Master") as! BWWalkthroughViewController
//        let page_one = stb.instantiateViewControllerWithIdentifier("page1") as UIViewController
//        let page_two = stb.instantiateViewControllerWithIdentifier("page2") as UIViewController
//        let page_three = stb.instantiateViewControllerWithIdentifier("page3") as UIViewController
//        
//        // Attach the pages to the master
//        walkthrough.delegate = self
//        walkthrough.addViewController(page_one)
//        walkthrough.addViewController(page_two)
//        walkthrough.addViewController(page_three)
        
        self.performSegueWithIdentifier("ToPostSegue", sender: self)
    }
    
    @IBAction func findRoomAction(sender: UIButton) {
        performSegueWithIdentifier("FindRoom", sender: nil)
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
