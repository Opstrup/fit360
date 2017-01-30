//
//  ViewController.swift
//  fit360
//
//  Created by Anders Opstrup on 27/09/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import UIKit

class DietCreationViewController: UIViewController {
    private var _dietCreationModel = DietCreationModel()
    
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var sex: UISwitch!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var bodyType: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func fetchData(sender: AnyObject) {
        print("Calling web services")
        callWebService()
    }
    
    func callWebService() {
        // Show MBProgressHUD Here
        var config : URLSessionConfiguration!
        var urlSession : URLSession!
        
        config = URLSessionConfiguration.default
        urlSession = URLSession(configuration: config)
        
        // MARK:- HeaderField
        let HTTPHeaderField_ContentType         = "Content-Type"
        
        // MARK:- ContentType
        let ContentType_ApplicationJson         = "application/json"
        
        //MARK: HTTPMethod
        let HTTPMethod_Get                      = "GET"
        
        let callURL = URL.init(string: "http://localhost:3000/")
        
        var request = URLRequest.init(url: callURL!)
        
        request.timeoutInterval = 60.0 // TimeoutInterval in Second
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue(ContentType_ApplicationJson, forHTTPHeaderField: HTTPHeaderField_ContentType)
        request.httpMethod = HTTPMethod_Get
        
        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            if error != nil{
                return
            }
            do {
                let resultJson = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:AnyObject]
                print("Result",resultJson!)
            } catch {
                print("Error -> \(error)")
            }
        }
        
        dataTask.resume()
    }

}

