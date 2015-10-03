//
//  NewTableViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 16.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class NewTableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")

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
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : SimpleTableViewCell = tableView.dequeueReusableCellWithIdentifier("TableCell") as! SimpleTableViewCell
        
        cell.someTextLabel!.text = "Some text"
        cell.numerLabel!.text = NSString(format: "#%d", indexPath.row) as String
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor(red: 222, green: 255, blue: 217, alpha: 1)
        }
        
        return cell
    }
}
