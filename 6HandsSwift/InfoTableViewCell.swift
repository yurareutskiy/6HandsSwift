//
//  InfoTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 24.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var valueParameterLabel: UILabel!
    @IBOutlet weak var nameParameterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }


}
