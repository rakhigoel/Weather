//
//  ViewController.swift
//  Weather
//
//  Created by Rakhi goel on 1/8/18.
//  Copyright © 2018 Rakhi goel. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: WBaseViewController , UITableViewDelegate , UITableViewDataSource , UISearchResultsUpdating , UISearchBarDelegate , UITextFieldDelegate{

    @IBOutlet weak var weatherTableView: UITableView!
    var weatherData : Array<AnyObject> = []
    let searchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = kAppTitle
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        
        //Search Controller Add
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false

        weatherTableView.tableHeaderView = searchController.searchBar
    }
    
    // MARK: SearchController Delegate

    func filterContentForSearchText(searchText: String, scope: Int) {

    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
        self.loadCurrentWeather(value: searchBar.text!)
        
        searchController.searchResultsController?.view.isHidden = true;

        
        searchBar.endEditing(true)

    }

    
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
        } else {
           
        }
        
        self.weatherTableView.reloadData()
    }


    
    // MARK: Check InternetAnd Load Data
    
    func loadCurrentWeather(value:String) {
        if self.checkNetworkConection(){
            print(value)
            
            let kApiURl = kBaseApiUrl+value+",oh,us&"+kAppId
            
            Alamofire.request(kApiURl, method: .get, parameters: nil, encoding: JSONEncoding.default)
                .responseJSON { response in
                    print(response)
                    //to get status code
                    if let status = response.response?.statusCode {
                        switch(status){
                            
                        case 201:
                            print("example success")
                        default:
                            print("error with response status: \(status)")
                        }
                        
                       
                    }
                    //to get JSON return value
                    if let result = response.result.value {
                        let JSON = result as! NSDictionary
                        
                        
                        if (JSON["cod"] as? String) != nil{
                            WUtility.showAlertViewController(onViewController: self, alertMsg: UAlertString.KAlertNoData, withTitle: UAlertString.kAlertHeader)

                        }
                         else{
                            
                            // UPdate TableView Data
                            
                            self.weatherData.insert(JSON, at: 0)
                            
                            print(self.weatherData)
                            
                            self.weatherTableView.reloadData()
                        }
                        
                    }

            }
            
        }
        
        
    }
    
    
    // MARK: TableView Delegate Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
       
        return weatherData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath)
        
        if let dict = weatherData[indexPath.row] as? NSDictionary
        {
            let title = dict["name"] as! String
            //cell.nameLabel.text = title
        }
        return cell
    }
    
    
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

