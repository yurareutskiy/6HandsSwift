//
//  SimpeTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 16.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

public enum SubwayLine {
    case Brown
    case Red
    case Purple
    case Blue
    
    var Color: UIColor {
        switch self {
            case .Brown: return UIColor.brownColor()
            case .Red: return UIColor.redColor()
            case .Purple: return UIColor.purpleColor()
            case .Blue: return UIColor.blueColor()
        }
    }
    
}

class SimpleTableViewCell: UITableViewCell {


    

    @IBOutlet weak var frameForStationImageView: UIImageView!
    @IBOutlet weak var yellowCorner: UIImageView!
    @IBOutlet weak var roomSquareLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numerLabel: UILabel!
    @IBOutlet weak var someTextLabel: UILabel!
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var colorStationView: UIView!
    @IBOutlet weak var stationNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        var numberFrame = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        numerLabel.backgroundColor = UIColor.clearColor()
        numerLabel.layer.borderWidth = 1.5
        numerLabel.layer.borderColor = UIColor.blackColor().CGColor
        numerLabel.layer.cornerRadius = 3
        numerLabel.layer.frame.width
        numerLabel.textAlignment = .Center
        
        colorStationView.layer.cornerRadius = colorStationView.frame.width / 2
        
        colorStationView.layer.borderWidth = 0.5
        colorStationView.layer.borderColor = UIColor.blackColor().CGColor
        yellowCorner.hidden = true

//        frameForStationImageView.frame = CGRectMake(
//            frameForStationImageView.frame.origin.x,
//            frameForStationImageView.frame.origin.y, 150, 10)
    
    
    
    
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func prepareForReuse() {
        yellowCorner.hidden = true
    }
    
    func formattedStringWithPrice(price: String) -> String {
        var lenghtString = price.characters.count
        var resultString: String = ""
        for char in price.characters {
            if (lenghtString % 3 == 0) && (price.characters.count != lenghtString) {
                resultString += " "
            }
            resultString += String(char)
            lenghtString -= 1
        }
        return resultString
    }
}
