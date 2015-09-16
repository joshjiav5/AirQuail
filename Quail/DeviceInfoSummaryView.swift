//
//  DeviceInfoSummaryView.swift
//  Quail
//
//  Created by JoshJSZ on 8/28/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

class DeviceInfoSummaryView: UIView {

    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreInfoLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    func commonInit() {
        self.backgroundColor = UIColor.clearColor()
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
