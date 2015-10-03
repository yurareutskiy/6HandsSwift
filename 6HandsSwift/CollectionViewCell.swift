//
//  CollectionViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 20.09.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func prepareForReuse() {
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
    }


}
