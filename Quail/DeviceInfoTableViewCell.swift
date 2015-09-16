//
//  DeviceInfoTableViewCell.swift
//  Quail
//
//  Created by JoshJSZ on 8/28/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

class DeviceInfoTableViewCell: UITableViewCell, UIScrollViewDelegate {
    @IBOutlet weak var cellContentView: UIView!
    @IBOutlet weak var cellScrollView: UIScrollView!
    @IBOutlet weak var cellPageControl: UIPageControl!
    
    var loaded: Bool = false
    private var _currentPage: UInt = 0
    var currentPage: UInt {
        set {
            self._currentPage = newValue
            self.cellPageControl.currentPage = Int(newValue)
        }
        get {
            return _currentPage
        }
    }
    var numberOfPages: UInt {
        var numOfViews: UInt = UInt(self.cellScrollView.subviews.count)
        if(self.cellScrollView.showsHorizontalScrollIndicator == true){
            numOfViews--
        }
        if(self.cellScrollView.showsVerticalScrollIndicator == true){
            numOfViews--
        }
        return numOfViews
    }
    private var contentHeight: CGFloat {
        return cellScrollView.frame.size.height
    }
    private var contentWidth: CGFloat {
        return cellScrollView.frame.size.width
    }
    private var totalContentWidth: CGFloat {
        return (contentWidth * CGFloat(numberOfPages))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cellScrollView.delegate = self
        self.cellPageControl.addTarget(self, action: "pageValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func addSummaryView() {
        self.layoutIfNeeded()
        let deviceInfoSummaryView = UINib(nibName: "DeviceInfoSummary", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as? DeviceInfoSummaryView
        deviceInfoSummaryView?.frame = CGRectMake(totalContentWidth, 0, contentWidth, contentHeight)
        self.cellScrollView.addSubview(deviceInfoSummaryView!)
        
        self.updateScrollViewContentSize()
        self.cellPageControl.numberOfPages = Int(self.numberOfPages)
    }
    
    func addChartView() {
        self.layoutIfNeeded()
        let deviceInfoChartView = UINib(nibName: "DeviceInfoChart", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as? DeviceInfoChartView
        deviceInfoChartView?.frame = CGRectMake(totalContentWidth, 0, contentWidth, contentHeight)
        deviceInfoChartView?.deviceReadingLabel.adjustsFontSizeToFitWidth = true

        self.cellScrollView.addSubview(deviceInfoChartView!)
        
        self.layoutIfNeeded()
        let preferredMaxLayoutWidth: CGFloat = deviceInfoChartView!.deviceReadingLabel.frame.size.width
        deviceInfoChartView?.deviceReadingLabel.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        deviceInfoChartView?.deviceReadingLabel.layoutSubviews()
        
        self.updateScrollViewContentSize()
        self.cellPageControl.numberOfPages = Int(self.numberOfPages)
    }
    
    func scrollToPage(page: UInt, animated: Bool) {
        var frame: CGRect = self.cellScrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page);
        frame.origin.y = 0;
        self.cellScrollView.scrollRectToVisible(frame, animated: animated)
        self.currentPage = page
    }
    
    func updateScrollViewContentSize() {
        self.cellScrollView.contentSize = CGSizeMake(totalContentWidth, contentHeight)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        var width: CGFloat = scrollView.frame.size.width;
        self.currentPage = UInt((scrollView.contentOffset.x + (0.5 * width)) / width)
    }
    
    func pageValueChanged(pageControl: UIPageControl) {
        self.scrollToPage(UInt(pageControl.currentPage), animated: true)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
