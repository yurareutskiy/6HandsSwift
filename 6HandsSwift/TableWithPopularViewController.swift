//
//  TableWithPopularViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 09.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class TableWithPopularViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tablePopular: UITableView!
    var data:NSArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tablePopular?.registerClass(SampleCellTableViewCell.self, forCellReuseIdentifier: "Cell")
        getDataForTable()
        // Do any additional setup after loading the view.
        tablePopular.delegate = self
        tablePopular.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getDataForTable() {
        data = ["BMW", "Mercedes", "Tesla", "Toyota", "Jeep"]
    }
    
    
    
    //MARK: - TableView
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:SampleCellTableViewCell = tablePopular.dequeueReusableCellWithIdentifier("Cell") as! SampleCellTableViewCell

        cell.textLabel!.text = data[indexPath.row] as? String ?? "[No Title]";
        
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

