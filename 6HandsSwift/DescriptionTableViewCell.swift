//
//  DescriptionTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 21.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

//        self.backgroundColor = UIColor.cyanColor()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
