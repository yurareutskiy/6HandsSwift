//
//  SampleCellTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 09.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class SampleCellTableViewCell: UITableViewCell {

    @IBOutlet weak var textNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
