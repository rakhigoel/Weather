//
//  WBaseViewController.swift
//  Weather
//
//  Created by Rakhi goel on 1/8/18.
//  Copyright © 2018 Rakhi goel. All rights reserved.
//

import UIKit
import Alamofire

class WBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func checkNetworkConection() -> Bool
    {
        if WReachability.isNetworkConnected()
        {
            return true
            
        }
        else
        {
            WUtility.showAlertViewController(onViewController: self, alertMsg: UAlertString.KAlertNoNetworkMsg, withTitle: UAlertString.kAlertHeader)
            
            return false
        }
    }
    
    
    func resignTextFields()
    {
        self.view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
