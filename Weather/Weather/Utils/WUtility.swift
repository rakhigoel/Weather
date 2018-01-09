//
//  WUtility.swift
//  Weather
//
//  Created by Rakhi goel on 1/8/18.
//  Copyright © 2018 Rakhi goel. All rights reserved.
//

import UIKit
import Foundation

class WUtility: NSObject {
    
    static func appDelegateSharedInstance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
        
    }

    class func controllerForClass(name: String,  storyBoardName:String) -> UIViewController
    {
        let identifier: String  = name
        let viewController:UIViewController = UIStoryboard(name: storyBoardName , bundle: nil).instantiateViewController(withIdentifier: identifier as String) as UIViewController
        
        return viewController
    }

    //_______________________ Alert ________________________//
    class func showAlertViewController(onViewController:UIViewController, alertMsg:String, withTitle:String)
    {
        let alert = UIAlertController(title: withTitle, message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: UAlertString.kAlertOk, style: UIAlertActionStyle.default, handler: nil))
        onViewController.present(alert, animated: true, completion: nil)
    }
    
    
}
