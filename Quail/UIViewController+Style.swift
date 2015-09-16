//
//  UIViewController+Style.swift
//  Quail
//
//  Created by JoshJSZ on 8/28/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

extension UIViewController {
    func applyMasterStylesForViewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
}
