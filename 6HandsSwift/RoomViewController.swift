//
//  RoomViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 24.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var infoParameters: [NSArray] = []
    var countParameters = 0
    var forLog: NSString = "temp"
    
    //@IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        table.delegate = self
        table.dataSource = self
        
        print(forLog)
        
        table.registerNib(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
//        table.contentSize = CGSizeMake(view.frame.width, 1100)
        
//        table.frame.size = CGSizeMake(view.frame.width, 450)
        // Logo in navigation bar
        
        let imgView = UIImageView(image: UIImage(named: "sixHandsLogo"))
        
        imgView.frame = CGRect(x: 13, y: 0, width: 80, height: 20)
        imgView.contentMode = UIViewContentMode.ScaleAspectFit
//        navBar.topItem?.titleView = imgView
//        navBar.frame = CGRectMake(0, 0, view.frame.width, 64)
        
        
        infoParameters = [["Общая", "100 м²"], ["Кухня", "25 м²"], ["Комнаты","75 м²"], ["Санузел","Совмещенный"], ["Балкон","Лоджия"], ["Мебель","Есть"], ["Телефон","Есть"], ["Plus","Можно с детьми"], ["Minus","Без животных"], ["Description", "После рабочего дня нам хочется расслабиться перед телевизором или компьютером, посмотреть что-то или поиграть."]]
        
        //  ["Description", "После рабочего дня нам хочется расслабиться перед телевизором или компьютером, посмотреть что-то или поиграть. Многие считают, что это расслабит их. Но это лишь сделает нас более уставшими. Иногда мы даже не замечаем, сколько времени прошло, пока мы смотрим наш любимый сериал, и это приводит к тому, что мы ложимся спать поздно. Попробуйте на протяжении недели отказаться от фильмов и игр перед сном, и вы заметите, насколько лучше и бодрее вы будете чувствовать себя по утрам. Лучше почитайте перед сном книгу, поговорите с родными или подумайте о прошедшем дне и планах на будущее."]
        
        countParameters = infoParameters.count // calculate numbers of parameters
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                return 130
            } else if (indexPath.row == countParameters) {
                let height = heightForView()
                print("Height 2: ", terminator: "")
                print(height)
                return height
//                return  476
            } else if (indexPath.row == (countParameters + 1)) {
                return 170
            } else if (indexPath.row == (countParameters + 2)) {
                return 70
            } else if (indexPath.row == (countParameters + 3)) {
                return 50
            }
        } else if (indexPath.section == 1) {
            return 60
        }

        return 40
    }
    
    func heightForView() -> CGFloat{
        let text = infoParameters[countParameters - 1][1] as! String
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, view.frame.width, CGFloat.max))
        let font = UIFont(name: "Helvetica", size: 15)
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        print("Height ", terminator: "")
        print(label.frame.height)
        let height = label.frame.height
        return height + 10 + (height / 10) + 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return countParameters + 3
        }
        return 2
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 1) {
            let rect = CGRectMake(-1, 0, self.view.frame.size.width + 1, 45)
            let header = UIView(frame: rect)
            let label = UILabel(frame: rect)
            label.text = "Похожие объявлления"
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont(name: "Helvetica", size: 15)
            header.addSubview(label)
            
            let separetor = UIView(frame: CGRectMake(0, 44, self.view.frame.width, 0.5))
            separetor.backgroundColor = UIColor.grayColor()
            separetor.alpha = 0.7
            header.addSubview(separetor)
            
            return header
        }
        return nil
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 0
        } 
        return 45
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            //        println(indexPath.row)
            if (indexPath.row >= countParameters + 3) {
                let cell = tableView.dequeueReusableCellWithIdentifier("emptyCell")! as UITableViewCell
                return cell
            }
            if (indexPath.row == 0) {
                return configureImageCell(tableView, rowAtIndexPath: indexPath)
            } else if (indexPath.row == (countParameters + 1)) {
                //            tableView.reloadInputViews()
                return configureMapCell(tableView, rowAtIndexPath: indexPath)
            } else if (indexPath.row == (countParameters + 2)) {
                return configureProfileCell(tableView, rowAtIndexPath: indexPath)
            } else if (indexPath.row == countParameters) {
                return configureDescriptionCell(tableView)
            }
            return configureInfoCell(tableView, rowAtIndexPath: indexPath)
        
        } else if (indexPath.section == 1) {
            return configureLikleyPostsCell(tableView, rowAtIndexPath: indexPath)
        }
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("emptyCell")! as UITableViewCell
        return cell

    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if (indexPath.section == 1) {
            return indexPath
        } else {
            return nil
        }
    }

    // MARK: Configurations for cells
    
    func configureImageCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> ImageScrollTableViewCell {
        
        let cell = table.dequeueReusableCellWithIdentifier("ImagesCell") as! ImageScrollTableViewCell
        cell.setTextForPriceLabel(String(1000))
        return cell
    }
    
    func configureInfoCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> InfoTableViewCell {
        print(indexPath.row)
        
        let cell = table.dequeueReusableCellWithIdentifier("InfoCell") as! InfoTableViewCell
        let tempArray = infoParameters[indexPath.row - 1]
        if (tempArray[0].isEqual("Plus") || tempArray[0].isEqual("Minus")) {
            let sign = (tempArray[0] as! String == "Plus") ? "+ " : "- "
            cell.nameParameterLabel.text = ""
            cell.valueParameterLabel.text = sign + (tempArray[1] as! String)
            return cell
        } /*else if (tempArray[0].isEqual("Description")) {
            let text = tempArray[1] as! String
            cell.valueParameterLabel.hidden = true
            cell.nameParameterLabel.hidden = true
            let margin = cell.textLabel?.frame.origin.x
            cell.textLabel?.frame.size = CGSizeMake(view.frame.width - (2 * margin!), CGFloat.max)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            cell.textLabel?.text = text
            cell.textLabel?.font = UIFont(name: "Helvetica", size: 15)
            cell.textLabel?.sizeToFit()
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)

            return cell
        }*/
        
        
        cell.nameParameterLabel.text = tempArray[0] as? String
        cell.valueParameterLabel.text = tempArray[1] as? String
        
//        tableView.reloadData()
        
        return cell
    }
    
    func configureDescriptionCell(tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell")! as UITableViewCell
        let text = infoParameters[countParameters - 1][1] as! String
        cell.textLabel?.text = text
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 15)
        return cell
    }
    
    func configureMapCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> MapTableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("MapCell") as! MapTableViewCell
        cell.setContentFrameWithStationName("Баррикадная", AndAddress: "Карамышесвская набережная, 56к2, 9 этаж, кв. 88")
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func configureProfileCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> SellerProfileTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SellerCell") as! SellerProfileTableViewCell
        cell.photoSellerImageView.image = UIImage(named: "man")
        cell.nameSellerLabel.text = "Alexandra Shulman"
        cell.gradeSellerWith(4)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func configureLikleyPostsCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> SimpleTableViewCell {
        let cell : SimpleTableViewCell = tableView.dequeueReusableCellWithIdentifier("TableCell", forIndexPath: indexPath) as! SimpleTableViewCell
        cell.someTextLabel!.text = "Карамышевская набережная, 56к2"
        cell.numerLabel!.text = NSString(format: "%d", indexPath.row + 1) as String
        cell.priceLabel!.text = SimpleTableViewCell().formattedStringWithPrice("100000")
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

}
