//
//  PopTableViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 20.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

@objc public protocol PopTableViewDelegate {
    
    func didSelect(text:String)
}

class PopTableViewController: UITableViewController {

    weak var delegate : PopTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.registerNib(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        

        print(self.navigationController?.viewControllers)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : SimpleTableViewCell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! SimpleTableViewCell
        
        //        let cell : SimpleTableViewCell = SimpleTableViewCell.init()
        
        //        cell.awakeFromNib()
        
        //        configure(cell, forRowAtIndexPath: indexPath)
        
        cell.someTextLabel!.text = "Карамышевская набережная, 56к2"
        cell.numerLabel!.text = NSString(format: "%d", indexPath.row + 1) as String
        cell.priceLabel!.text = formattedStringWithPrice("100000")
        cell.roomSquareLabel!.text = "123 м²"
        
        if indexPath.row % 3 == 0 {
            cell.yellowCorner.hidden = false
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundCellView.backgroundColor = UIColor.whiteColor()
        } else {
            cell.backgroundCellView.backgroundColor = UIColor(patternImage: UIImage(named: "greenBackForCell")!)
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

//        let vc = MainTablesViewController()
//        vc.performSegueWithIdentifier("toRoomPage", sender: self)
//        let vc = MainTablesViewController()
//        vc.toPageMenu()
        
        performSegueWithIdentifier("toRoomPage", sender: self)

    }
    
    func configure(cell: SimpleTableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.someTextLabel!.text = "Карамышевская набережная, 56к2"
        cell.numerLabel!.text = NSString(format: "%d", indexPath.row + 1) as String
        cell.priceLabel!.text = formattedStringWithPrice("100000")
        cell.roomSquareLabel!.text = "123 м²"
        
        if indexPath.row % 3 == 0 {
            cell.yellowCorner.hidden = false
        }
        cell.colorStationView.backgroundColor = SubwayLine.Purple.Color
        if indexPath.row % 2 == 0 {
            cell.backgroundCellView.backgroundColor = UIColor.whiteColor()
        } else {
            cell.backgroundCellView.backgroundColor = UIColor(patternImage: UIImage(named: "greenBackForCell")!)
        }
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
        return resultString + " ₽"
    }


}
