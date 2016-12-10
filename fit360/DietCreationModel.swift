//
//  DietCreationModel.swift
//  fit360
//
//  Created by Anders Opstrup on 23/10/2016.
//  Copyright © 2016 smallcity. All rights reserved.
//

import Foundation

class DietCreationModel {
 
    func fetchData() -> String {
        let url = NSURL(string : "http://localhost:3000/")
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            print(data)
        }.resume()
        
        return "Hello from model!!"
    }
    
}
