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
    
    @IBOutlet weak var navBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        table.delegate = self
        table.dataSource = self
        
        // Logo in navigation bar
        
        let imgView = UIImageView(image: UIImage(named: "sixHandsLogo"))
        
        imgView.frame = CGRect(x: 13, y: 0, width: 80, height: 20)
        imgView.contentMode = UIViewContentMode.ScaleAspectFit
        navBar.topItem?.titleView = imgView
        navBar.frame = CGRectMake(0, 0, view.frame.width, 64)
        
        
        infoParameters = [["Общая", "100 м²"], ["Кухня", "25 м²"], ["Комнаты","75 м²"], ["Санузел","Совмещенный"], ["Балкон","Лоджия"], ["Мебель","Есть"], ["Телефон","Есть"], ["Plus","Можно с детьми"], ["Minus","Без животных"], ["Description", "После рабочего дня нам хочется расслабиться перед телевизором или компьютером, посмотреть что-то или поиграть. Многие считают, что это расслабит их. Но это лишь сделает нас более уставшими. Иногда мы даже не замечаем, сколько времени прошло, пока мы смотрим наш любимый сериал, и это приводит к тому, что мы ложимся спать поздно. Попробуйте на протяжении недели отказаться от фильмов и игр перед сном, и вы заметите, насколько лучше и бодрее вы будете чувствовать себя по утрам. Лучше почитайте перед сном книгу, поговорите с родными или подумайте о прошедшем дне и планах на будущее."]]
        
        countParameters = infoParameters.count // calculate numbers of parameters
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if (indexPath.row == 0) {
            return 130
        } else if (indexPath.row == countParameters) {
            return heightForView()
        } else if (indexPath.row == (countParameters + 1)) {
            return 170
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
        return label.frame.height
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countParameters + 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row >= countParameters + 2) {
            let cell = tableView.dequeueReusableCellWithIdentifier("emptyCell") as! UITableViewCell
            return cell
        }
        if (indexPath.row == 0) {
            return configureImageCell(tableView, rowAtIndexPath: indexPath)
        } else if (indexPath.row == (countParameters + 1)) {
            tableView.reloadInputViews()
            return configureMapCell(tableView, rowAtIndexPath: indexPath)
        }
        return configureInfoCell(tableView, rowAtIndexPath: indexPath)
    }


    // MARK: Configurations for cells
    
    func configureImageCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> ImageScrollTableViewCell {
        
        let cell = table.dequeueReusableCellWithIdentifier("ImagesCell") as! ImageScrollTableViewCell
        cell.setTextForPriceLabel(String(1000))
        return cell
    }
    
    func configureInfoCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> InfoTableViewCell {
        
        
        let cell = table.dequeueReusableCellWithIdentifier("InfoCell") as! InfoTableViewCell
        let tempArray = infoParameters[indexPath.row - 1]
        if (tempArray[0].isEqual("Plus") || tempArray[0].isEqual("Minus")) {
            let sign = (tempArray[0] as! String == "Plus") ? "+ " : "- "
            cell.nameParameterLabel.text = ""
            cell.valueParameterLabel.text = sign + (tempArray[1] as! String)
            return cell
        } else if (tempArray[0].isEqual("Description")) {
            let text = tempArray[1] as! String
            cell.valueParameterLabel.hidden = true
            cell.nameParameterLabel.hidden = true
            let margin = cell.textLabel?.frame.origin.x
            cell.textLabel?.frame.size = CGSizeMake(view.frame.width - (2 * margin!), CGFloat.max)
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
            cell.textLabel?.text = text
            cell.textLabel?.sizeToFit()
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)

            return cell
        }
        
        
        cell.nameParameterLabel.text = tempArray[0] as? String
        cell.valueParameterLabel.text = tempArray[1] as? String
        

        return cell
    }
    
    func configureMapCell(tableView: UITableView, rowAtIndexPath indexPath: NSIndexPath) -> MapTableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("MapCell") as! MapTableViewCell
        cell.setContentFrameWithStationName("Баррикадная", AndAddress: "Карамышесвская набережная, 56к2, 9 этаж, кв. 88")
        
        
        
        return cell
    }

}
