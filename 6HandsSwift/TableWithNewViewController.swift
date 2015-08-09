//
//  TableWithNewViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 09.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit


class TableWithNewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var table: UITableView!
    var data:NSArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        getDataForTable()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getDataForTable() {
        data = ["apple", "banana", "tomatos", "strawberry", "potatoe"]
    }
    
    
    
    //MARK: - TableView
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = table.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        //        let stringWithNumber = String(NSString(format: "%d", indexPath.row + 1))
        
        
        cell.textLabel?.text = data[indexPath.row] as? String;
        
        return cell
    }
    
    
    
    //     //MARK: - Navigation
    //
    //     In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    //         Get the new view controller using segue.destinationViewController.
    //         Pass the selected object to the new view controller.
    //    }
    
    
}