//
//  PostThirdViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 10.10.15.
//  Copyright © 2015 reutskiy. All rights reserved.
//

import UIKit

class PostThirdViewController: UIViewController {
    
    @IBOutlet var point:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        point.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
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
