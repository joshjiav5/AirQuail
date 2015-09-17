//
//  MainTableViewController.swift
//  AirQuail
//
//  Created by JoshJSZ on 9/16/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    @IBOutlet var cells: [UITableViewCell]!
    @IBOutlet var cellViews: [UIView]!
    @IBOutlet var dateLabels: [UILabel]!
    @IBOutlet weak var coReadingLabel: UILabel!
    @IBOutlet weak var tempReadingLabel: UILabel!
    @IBOutlet weak var pmReadingLabel: UILabel!
    @IBOutlet weak var odReadingLabel: UILabel!
    @IBOutlet weak var methaneReadingLabel: UILabel!
    @IBOutlet weak var refreshBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewStyle()
        self.updateDatas()
        refreshBarButton.target = self
        refreshBarButton.action = "touchRefreshButton:"
    }
    
    func setupViewStyle() {
        tableView.backgroundView = UIImageView(image: UIImage(named: "background")!)
        for cell in cells {
            cell.backgroundView = nil
            cell.backgroundColor = UIColor.clearColor()
        }
        for cellView in cellViews {
            cellView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func touchRefreshButton(sender:UIBarButtonItem!) {
        self.updateDatas()
    }
    
    func updateDatas() {
        let networkMan = NetworkManager()
        if let var airData = networkMan.getLastRecord() {
            for label in dateLabels {
                if(airData.recordedDate != nil) {
                    var dateFormatter:NSDateFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "MMM dd"
                    label.text = "\(dateFormatter.stringFromDate(airData.recordedDate!))"
                } else {
                    label.text = "--"
                }
            }
            
            if(airData.coLevel != nil) {
                self.coReadingLabel.text = "\(airData.coLevel!)"
            } else {
                self.coReadingLabel.text = "--"
            }
            
            if(airData.temperature != nil) {
                self.tempReadingLabel.text = "\(airData.temperature!)"
            } else {
                self.tempReadingLabel.text = "--"
            }
            
            if(airData.pmLevel != nil) {
                self.pmReadingLabel.text = "\(airData.pmLevel!)"
            } else {
                self.pmReadingLabel.text = "--"
            }
            
            if(airData.odLevel != nil) {
                self.odReadingLabel.text = "\(airData.odLevel!)"
            } else {
                self.odReadingLabel.text = "--"
            }
            
            if(airData.methaneLevel != nil) {
                self.methaneReadingLabel.text = "\(airData.methaneLevel!)"
            } else {
                self.methaneReadingLabel.text = "--"
            }
        }
    }
}
