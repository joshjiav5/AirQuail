//
//  DeviceInfoChartView.swift
//  AirQuail
//
//  Created by JoshJSZ on 8/31/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit
import Charts

class DeviceInfoChartView: UIView {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var chartView: BarChartView!
    @IBOutlet weak var deviceReadingLabel: UILabel!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    func commonInit() {
        self.backgroundColor = UIColor.clearColor()
        self.topView?.backgroundColor = UIColor.clearColor()
        self.chartView?.backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
}
