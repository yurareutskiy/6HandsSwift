//
//  RightMenuViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 17.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class RightMenuViewController: UIViewController {

    @IBOutlet weak var choosenSubwayStationLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    
    @IBOutlet var numberRoomsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        for button:UIButton in numberRoomsCollection {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blackColor().CGColor
        }
        
        choosenSubwayStationLabel.clipsToBounds = true
        choosenSubwayStationLabel.layer.cornerRadius = choosenSubwayStationLabel.frame.size.height / 2
        
        backgroundView!.backgroundColor = UIColor(patternImage: UIImage(named: "menuBackgroundColor")!)

        
        let rangeSlider = TTRangeSlider(frame: CGRectMake(10, 160, 260, 20))
        rangeSlider.tintColor = UIColor.whiteColor()
        rangeSlider.minLabelColour = UIColor.blackColor()
        rangeSlider.maxLabelColour = UIColor.blackColor()
        view.addSubview(rangeSlider)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func chooseNumberRoomsButton(sender: UIButton) {
        println(sender.selected)
        if sender.selected == false {
            sender.selected = true
            sender.backgroundColor = UIColor.blackColor()
            sender.tintColor = UIColor.blackColor()
        } else {
            sender.selected = false
            sender.backgroundColor = UIColor.whiteColor()
            sender.tintColor = UIColor.whiteColor()
        }
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
