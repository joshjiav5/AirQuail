//
//  NoAnimationSegue.swift
//  Quail
//
//  Created by JoshJSZ on 8/25/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

class NoAnimationSegue: UIStoryboardSegue {
    override func perform() {
        self.sourceViewController.presentViewController(self.destinationViewController as! UIViewController,
            animated: false,
            completion: nil)
    }
}
