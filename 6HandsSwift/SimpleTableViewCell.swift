//
//  SimpeTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 16.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit


class SimpleTableViewCell: UITableViewCell {


    @IBOutlet weak var roomSquareLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numerLabel: UILabel!
    @IBOutlet weak var someTextLabel: UILabel!
    @IBOutlet weak var backgroundCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        var numberFrame = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        numerLabel.backgroundColor = UIColor.clearColor()
        numerLabel.layer.borderWidth = 1.5
        numerLabel.layer.borderColor = UIColor.blackColor().CGColor
        numerLabel.layer.cornerRadius = 3
        numerLabel.layer.frame.width
        numerLabel.textAlignment = .Center
        

        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
