//
//  MainViewController.swift
//  Quail
//
//  Created by JoshJSZ on 8/25/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var infoPageControl: UIPageControl!
    @IBOutlet weak var refreshBarButton: UIBarButtonItem!
    
    var lastRecord: AirData! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyMasterStylesForViewDidLoad()
        self.setupViewStyle()
        infoTableView.delegate = self
        infoTableView.dataSource = self
        refreshBarButton.target = self
        refreshBarButton.action = "touchRefreshButton:"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViewStyle() {
        infoTableView.backgroundColor = UIColor.clearColor()
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("deviceInfoCell", forIndexPath: indexPath) as! UITableViewCell
        let deviceInfoCell = cell as? DeviceInfoTableViewCell
        if(deviceInfoCell?.loaded == false) {
            deviceInfoCell!.backgroundColor = UIColor.clearColor()
            deviceInfoCell!.addSummaryView()
            deviceInfoCell!.addChartView()
            deviceInfoCell?.loaded = true
        }
        deviceInfoCell?.scrollToPage(deviceInfoCell!.currentPage, animated: false)
    
        return deviceInfoCell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(lastRecord == nil) {
            return 0
        } else {
            return 1
        }
    }
    
    func touchRefreshButton(sender:UIBarButtonItem!) {
        let networkMan = NetworkManager()
        self.lastRecord = networkMan.getLastRecord()
        self.infoTableView.reloadData()
    }
}
