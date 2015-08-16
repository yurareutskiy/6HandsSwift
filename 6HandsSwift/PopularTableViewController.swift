//
//  PopularTableViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 16.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class PopularTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        
        
        self.tableView.separatorColor = UIColor.clearColor()
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
        let cell : SimpleTableViewCell = tableView.dequeueReusableCellWithIdentifier("TableCell") as! SimpleTableViewCell
        
        configure(cell, forRowAtIndexPath: indexPath)

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func configure(cell: SimpleTableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.someTextLabel!.text = "Карамышевская набережная, 56к2"
        cell.numerLabel!.text = NSString(format: "%d", indexPath.row + 1) as String
        cell.priceLabel!.text = formattedStringWithPrice("100000")
        cell.roomSquareLabel!.text = "123 м²"
        
        if indexPath.row % 2 == 0 {
            cell.backgroundCellView.backgroundColor = UIColor.whiteColor()
        } else {
            cell.backgroundCellView.backgroundColor = UIColor(patternImage: UIImage(named: "greenBackForCell")!)
        }
    }

    func formattedStringWithPrice(price: String) -> String {
        var lenghtString = count(price)
        var resultString: String = ""
        for char in price {
            if (lenghtString % 3 == 0) && (count(price) != lenghtString) {
                resultString += " "
            }
            resultString += String(char)
            lenghtString -= 1
        }
        return resultString
    }
}
