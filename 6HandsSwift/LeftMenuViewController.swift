//
//  LeftMenuViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 12.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {

    @IBOutlet weak var manWantButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var photoUserImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        manWantButton.imageEdgeInsets = UIEdgeInsetsMake(0, manWantButton.frame.size.width - (17 + 15), 0, 0);
//        manWantButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 17);

        
        backgroundView!.backgroundColor = UIColor(patternImage: UIImage(named: "menuBackgroundColor")!)
        
        photoUserImageView.layer.cornerRadius = photoUserImageView.frame.width / 2
        photoUserImageView.layer.borderWidth = 0.7
        photoUserImageView.image = UIImage(named: "man")
        photoUserImageView.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
