//
//  ViewController.swift
//  Quail
//
//  Created by JoshJSZ on 8/23/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.applyMasterStylesForViewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "showMainViewController", userInfo: nil, repeats: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showMainViewController() {
        self.performSegueWithIdentifier("showMainView", sender: nil)
    }

}

