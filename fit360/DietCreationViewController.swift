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
       
    }

}

