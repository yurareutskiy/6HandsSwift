//
//  PostSecondViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 07.10.15.
//  Copyright © 2015 reutskiy. All rights reserved.
//

import UIKit

class PostSecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var fields: [UITextField]!
    var pickers = [UIPickerView?](count: 7, repeatedValue: nil)
    var i: Int = 0
    
    var pickerDict: NSDictionary = [0: ["1", "2", "3", "4"], 1: ["Совмещенный", "Несовмещенный"], 2: ["Лоджия", "Нелоджия"], 3: ["Есть", "Нет"], 4: ["Есть", "Нет"], 5: ["Да", "Нет"], 6: ["Есть", "Нет"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in pickers {
            let picker = UIPickerView()
            picker.dataSource = self
            picker.delegate = self
            picker.showsSelectionIndicator = true
            picker.tag = i
            fields[i].inputView = picker
            i++
        }
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return (pickerDict[pickerView.tag]?.count)!
        }
        else if pickerView.tag == 1 {
            return (pickerDict[pickerView.tag]?.count)!
        }
        else if pickerView.tag == 2 {
            return (pickerDict[pickerView.tag]?.count)!
        }
        else if pickerView.tag == 3 {
            return (pickerDict[pickerView.tag]?.count)!
        }
        else if pickerView.tag == 4 {
            return (pickerDict[pickerView.tag]?.count)!
        }
        else if pickerView.tag == 5 {
            return (pickerDict[pickerView.tag]?.count)!
        }
        else if pickerView.tag == 6 {
            return (pickerDict[pickerView.tag]?.count)!
        }
        else {
            return 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            let onePickerDict = pickerDict.objectForKey(0) as! [String]
            return onePickerDict[row]
        }
        else if pickerView.tag == 1 {
            let onePickerDict = pickerDict.objectForKey(1) as! [String]
            return onePickerDict[row]
        }
        else if pickerView.tag == 2 {
            let onePickerDict = pickerDict.objectForKey(2) as! [String]
            return onePickerDict[row]
        }
        else if pickerView.tag == 3 {
            let onePickerDict = pickerDict.objectForKey(3) as! [String]
            return onePickerDict[row]
        }
        else if pickerView.tag == 4 {
            let onePickerDict = pickerDict.objectForKey(4) as! [String]
            return onePickerDict[row]
        }
        else if pickerView.tag == 5 {
            let onePickerDict = pickerDict.objectForKey(5) as! [String]
            return onePickerDict[row]
        }
        else if pickerView.tag == 6 {
            let onePickerDict = pickerDict.objectForKey(6) as! [String]
            return onePickerDict[row]
        }
        else {
            return ""
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            let onePickerDict = pickerDict.objectForKey(0) as! [String]
            fields[0].text = onePickerDict[row]
        }
        else if pickerView.tag == 1 {
            let onePickerDict = pickerDict.objectForKey(1) as! [String]
            fields[1].text = onePickerDict[row]
        }
        else if pickerView.tag == 2 {
            let onePickerDict = pickerDict.objectForKey(2) as! [String]
            fields[2].text = onePickerDict[row]
        }
        else if pickerView.tag == 3 {
            let onePickerDict = pickerDict.objectForKey(3) as! [String]
            fields[3].text = onePickerDict[row]
        }
        else if pickerView.tag == 4 {
            let onePickerDict = pickerDict.objectForKey(4) as! [String]
            fields[4].text = onePickerDict[row]
        }
        else if pickerView.tag == 5 {
            let onePickerDict = pickerDict.objectForKey(5) as! [String]
            fields[5].text = onePickerDict[row]
        }
        else if pickerView.tag == 6 {
            let onePickerDict = pickerDict.objectForKey(6) as! [String]
            fields[6].text = onePickerDict[row]
        }
        else {
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
