//
//  RoomPageViewController.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 20.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class RoomPageViewController: UIViewController, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var infoTable: UITableView!

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imagesScrollView: UIScrollView!
    var containerView: UIView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    var optionsInfoCount: Int = 0
    
    var infoParameters: [NSArray] = []
    
    var heightDescriptionCell: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoParameters = [["Общая", "100 м²"], ["Кухня", "25 м²"], ["Комнаты","75 м²"], ["Санузел","Совмещенный"], ["Балкон","Лоджия"], ["Мебель","Есть"], ["Телефон","Есть"], ["Plus","Можно с детьми"], ["Minus","Без животных"], ["Description", "После рабочего дня нам хочется расслабиться перед телевизором или компьютером, посмотреть что-то или поиграть. Многие считают, что это расслабит их. Но это лишь сделает нас более уставшими. Иногда мы даже не замечаем, сколько времени прошло, пока мы смотрим наш любимый сериал, и это приводит к тому, что мы ложимся спать поздно. Попробуйте на протяжении недели отказаться от фильмов и игр перед сном, и вы заметите, насколько лучше и бодрее вы будете чувствовать себя по утрам. Лучше почитайте перед сном книгу, поговорите с родными или подумайте о прошедшем дне и планах на будущее."]]
        
        // Logo in navigation bar
        
        let imgView = UIImageView(image: UIImage(named: "sixHandsLogo"))
        
        imgView.frame = CGRect(x: 13, y: 0, width: 80, height: 20)
        imgView.contentMode = UIViewContentMode.ScaleAspectFit
        navBar.topItem?.titleView = imgView
        
        
        // Set up the container view to hold your custom view hierarchy
        let containerSize = CGSizeMake(640.0, 640.0)
        containerView = UIView(frame: CGRect(origin: CGPointMake(0.0, 0.0), size:containerSize))
        scroll.addSubview(containerView)
        
        // Scroll
        
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor = UIColor(patternImage: UIImage(named: "blueColor")!)
        pageControl.currentPage = 2
        
        // Arrays
        
        pageImages = [UIImage(named: "kvartira.jpg")!, UIImage(named: "kvartira2.jpg")!, UIImage(named: "kvartira3.jpg")!]
        let pageCount = pageImages.count
        
        // Set up the page control
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        // Set up the array to hold the views for each page
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        // Set up the content size of the scroll view
        let pagesScrollViewSize = imagesScrollView.frame.size
        imagesScrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
        
        // Tell the scroll view the size of the contents
        scroll.contentSize = CGSizeMake(320.0, 1640.0);
        
        // Set up the minimum & maximum zoom scale
        let scrollViewFrame = scroll.frame
        let scaleWidth = scrollViewFrame.size.width / scroll.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scroll.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        
        scroll.minimumZoomScale = minScale
        scroll.maximumZoomScale = 1.0
        scroll.zoomScale = 1.0
    
        // Determine height description cell and set table view height
        let text = infoParameters.last!.objectAtIndex(1) as! NSString
        let font = UIFont(name: "Helvetica", size: 15.0)
        
        heightDescriptionCell = heightForView(text as String, WithFont: font!, AndWidth: view.frame.size.width - 40) + 20
        let tableHeight = CGFloat((infoParameters.count - 1) * 40) + heightDescriptionCell
        
        infoTable.frame.size = CGSizeMake(view.frame.size.width, tableHeight)
        
        centerScrollViewContents()
        
        loadVisiblePages()
        
    }
    

    
    func centerScrollViewContents() {
        let boundsSize = scroll.bounds.size
        var contentsFrame = containerView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else {
            contentsFrame.origin.x = 0.0
        }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else {
            contentsFrame.origin.y = 0.0
        }
        
        containerView.frame = contentsFrame
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return containerView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Actions
    
    @IBAction func favoriteButtonAction(sender: UIButton) {
        
        if sender.selected == false {
            sender.selected = true
        } else {
            sender.selected = false
        }
    }
    
    // MARK: Scroll view with images
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        let pageWidth = imagesScrollView.frame.size.width
        let page = Int(floor((imagesScrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for index in firstPage...lastPage {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
    }
    
    func loadPage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Load an individual page, first checking if you've already loaded it
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            var frame = imagesScrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            frame = CGRectInset(frame, 0.0, 0.0)
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFill
            newPageView.frame = frame
            imagesScrollView.addSubview(newPageView)
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        if scrollView.isEqual(imagesScrollView) == true {
            loadVisiblePages()
        }
    }
    
    
    // MARK: Table View
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == (infoParameters.count - 1) {

            return heightDescriptionCell
        }
        return 40.0
    }
    
    func heightForView(text:String, WithFont font:UIFont, AndWidth width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoParameters.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 
        var infoData = infoParameters[indexPath.row]
        
        if infoData[0] as! String != "Description" {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("InfoCell") as! InfoRoomTableViewCell
            
            if infoData[0] as! String == "Plus" || infoData[0] as! String == "Minus" {
                let sign = (infoData[0] as! String == "Plus") ? "+ " : "- "
                cell.parameterNameLabel.text = ""
                cell.valueParameterLabel.text = sign + (infoData[1] as! String)
            } else {
                cell.parameterNameLabel.text = infoData[0] as? String
                cell.valueParameterLabel.text = infoData[1] as? String
            }
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Description") as! DescriptionTableViewCell
    
        cell.descriptionTextLabel.text = infoData[1] as? String
        cell.descriptionTextLabel.frame.size = CGSizeMake(280, 415)
        
        println(cell.descriptionTextLabel.frame.size.height)
        println(cell.frame.size.height)
        
        
        return cell
        
    }



}
