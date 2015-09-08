//
//  SellerProfileTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 27.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class SellerProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var photoSellerImageView: UIImageView!
    @IBOutlet weak var nameSellerLabel: UILabel!
    @IBOutlet var gradeSellerCollection: [UIImageView]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoSellerImageView.layer.cornerRadius = photoSellerImageView.frame.width / 2
        photoSellerImageView.clipsToBounds = true

        photoSellerImageView.layer.borderWidth = 1.5
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func gradeSellerWith(grade: Int) {
        if (grade <= 0 || grade > 5) {
            return
        }
        for (var i = 0; i < grade; i++) {
            gradeSellerCollection[i].image = UIImage(named: "star")
        }
    }
    
    
    
}
