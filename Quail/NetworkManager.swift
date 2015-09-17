//
//  NetworkManager.swift
//  AirQuail
//
//  Created by JoshJSZ on 9/10/15.
//  Copyright (c) 2015 Josh. All rights reserved.
//

import UIKit

let lastRecordEndpoint:String = "http://airquail.herokuapp.com/user/quail/lastrecord"
let lastChartDataEndpoint:String = "http://airquail.herokuapp.com/user/quail/chartData"
let dictKey_coLevel:String = "co"
let dictKey_pmLevel:String = "pm"
let dictKey_temperature:String = "temp"
let dictKey_recordedDate:String = "timestamp"
let dictKey_username:String = "username"
let dictKey_methaneLevel:String = "methane"
let dictKey_odLevel:String = "od"

class NetworkManager {
    func getLastRecord() -> AirData? {
        var airData: AirData? = AirData()
        var rawData: AnyObject? = getData(NSURL(string: lastRecordEndpoint)!)
        
        if let dictData = rawData as? NSDictionary {
            airData = self.airDataFromDict(dictData)
        }
        
        return airData
    }
    
    func getLastChartData() -> NSArray? {
        var result: NSMutableArray = NSMutableArray(array: [])
        var rawData: AnyObject? = getData(NSURL(string: lastChartDataEndpoint)!)
        
        if let arrayData = rawData as? NSArray {
            for rawDictData in arrayData {
                if let dictData = rawDictData as? NSDictionary {
                    let airData: AirData? = self.airDataFromDict(dictData)
                    result.addObject(airData!)
                }
            }
        }
        
        return result
    }
    
    func getData(url: NSURL) -> AnyObject? {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        var data: NSData? = NSData(contentsOfURL: url)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        if(data != nil) {
            var structuredDataObj: AnyObject? = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil)
            return structuredDataObj
        } else {
            return nil
        }
    }
    
    func airDataFromDict(dictData: NSDictionary!) -> AirData {
        var airData: AirData? = AirData()
        
        if let coLevel = dictData!.objectForKey(dictKey_coLevel) as? Double {
            airData?.coLevel = coLevel
        }
        if let pmLevel = dictData!.objectForKey(dictKey_pmLevel) as? Double {
            airData?.pmLevel = pmLevel
        }
        if let temperature = dictData!.objectForKey(dictKey_temperature) as? Double {
            airData?.temperature = temperature
        }
        if let recordedDateString = dictData!.objectForKey(dictKey_recordedDate) as? String {
            let dateFormatter: NSDateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
            airData?.recordedDate = dateFormatter.dateFromString(recordedDateString)
        }
        if let username = dictData!.objectForKey(dictKey_username) as? String {
            airData?.username = username
        }
        if let methaneLevel = dictData!.objectForKey(dictKey_methaneLevel) as? Double {
            airData?.methaneLevel = methaneLevel
        }
        if let odLevel = dictData!.objectForKey(dictKey_odLevel) as? Double {
            airData?.odLevel = odLevel
        }
        return airData!
    }
}
