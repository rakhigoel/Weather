//
//  WStringConstants.swift
//  Weather
//
//  Created by Rakhi goel on 1/8/18.
//  Copyright © 2018 Rakhi goel. All rights reserved.
//


import Foundation
import UIKit

struct UAlertString {
    
    static let KAlertNoNetworkMsg     = "Internet connection appears to be offline"
    static let kAlertHeader           = "Weather"
    static let kAlertOk               = "OK"
    
    static let KAlertOptionCancel     = "Cancel"
    
    static let kAlertTimeOut     = "Request time out."
    
    static let kAlertForYes = "Yes"
    static let kAlertForNO = "No"
    static let KAlertNoData     = "Sorry! No data found"

}


struct ErrorResult{
    
    static let kBadRequest   = 400
    static let kUnauthorised = 401
    static let kDeactivated = 423
    static let kSearchExceeded = 403
    static let kUnAvailable = 404
    static let kUnProcessableEntity = 422
    static let kConflict = 409
    
}


let kAppId = "APPID=193a6d40e4c0aeb17c02dced7d2f3eda"
let kBaseApiUrl = "https://api.openweathermap.org/data/2.5/weather?q="

//let kIconUrl = "https://openweathermap.org/img/w/10d.png"

let kAppTitle = "Weather"
let kDetailTitle = "Weather"


//MARK: StoryboardName
struct StoryBoardName {
    
    static let kMain           = "Main"
    
}

