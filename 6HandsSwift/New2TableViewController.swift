//
//  New2TableViewController.swift
//  6HandsSwift
//
//  Created by Anton Scherbakov on 18/10/15.
//  Copyright © 2015 reutskiy. All rights reserved.
//

import UIKit

@objc public protocol New2TableViewDelegate {
    
    func didSelect(text:String)
}

class New2TableViewController: UITableViewController {
    
    weak var delegate : New2TableViewDelegate?

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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("RoomPage") as! RoomViewController
        
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
        return resultString
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
