//
//  ImageScrollTableViewCell.swift
//  6HandsSwift
//
//  Created by Reutskiy Jury on 24.08.15.
//  Copyright (c) 2015 reutskiy. All rights reserved.
//

import UIKit

class ImageScrollTableViewCell: UITableViewCell, UIScrollViewDelegate {

    
    // Outlets
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var imagesScrollView: UIScrollView!
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var imagesPageControll: UIPageControl!
    @IBOutlet weak var priceLabel: UILabel!
    

    // Arrays for ImageViews and Images
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    var pageWidth: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Setup scroll view for images
        
    }

    func setScrollViewWith(widthScroll: CGFloat) {
    
        pageWidth = widthScroll
        
        imagesScrollView.delegate = self
        imagesScrollView.bounces = false
        
        // Custom label for price
        
        priceLabel.layer.cornerRadius = 5
        priceLabel.clipsToBounds = true
        
        // Fill the arrays
        
        pageImages = [UIImage(named: "kvartira.jpg")!, UIImage(named: "kvartira2.jpg")!, UIImage(named: "kvartira3.jpg")!]
        let pageCount = pageImages.count
        
        // Custom page controller
        
        imagesPageControll.pageIndicatorTintColor = UIColor.whiteColor()
        imagesPageControll.currentPageIndicatorTintColor = UIColor(patternImage: UIImage(named: "blueColor")!)
        imagesPageControll.currentPage = 0
        imagesPageControll.numberOfPages = pageCount
        
        
        // Set up the array to hold the views for each page
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        // Set up the content size of the scroll view
        imagesScrollView.contentSize = CGSizeMake(pageWidth * CGFloat(pageImages.count), widthScroll * (3/4))
        
        loadVisiblePages() // Make magic for showing images in row

    
    }
    
    
    func setTextForPriceLabel(text:String) {
        priceLabel.text = formattedStringWithPrice(text)
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
        return (resultString + " ₽")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Actions

    @IBAction func favoritesAction(sender: UIButton) {
        
        if sender.selected == false {
            sender.selected = true
        } else {
            sender.selected = false
        }
        
    }
    
    
    // MARK: Scroll view with images
    
    func loadVisiblePages() {
        // First, determine which page is currently visible
        
        let page = Int(floor((imagesScrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        
        print("loadVisiblePages scroll width " + pageWidth.description)
        
        // Update the page control
        imagesPageControll.currentPage = page
        
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
            print(page)
            print(imagesScrollView.frame)
            var frame = imagesScrollView.bounds
            frame.origin.x = pageWidth * CGFloat(page)
            frame.origin.y = 0.0
            frame.size.height = pageWidth * (3/4)
            frame = CGRectInset(frame, 0.0, 0.0)
            
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleToFill

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
    // MARK: UIScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // Load the pages that are now on screen
        loadVisiblePages()
        
    }
}
