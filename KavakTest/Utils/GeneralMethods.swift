//
//  GeneralMethods.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/31/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import Foundation
import UIKit
class GeneralMethods {
    
    func getColor(color: String) -> UIColor {
        switch color {
        case "Pink":
            return Contants.colorPink
        case "Green":
            return Contants.colorGreen
        case "Red":
            return Contants.colorRed
        case "Black":
            return Contants.colorBlack
        case "Gray":
            return Contants.colorGray
       
        default:
            return UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
        }
    }
    
     func serializeResponse(withData responseData: String) -> [String:Any]? {
        if responseData.data(using: .utf8) != nil {
            do {
                let data = responseData.data(using: .utf8)
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                return jsonData
            } catch {
                print(error.localizedDescription)
                return nil
            }
        } else {
            return nil
        }
    }
    
     func parseGetGnomes(stringResponse: String, completion: @escaping(_ success: Bool, _ object: Any?) -> Void) {
        guard let dataJSON = serializeResponse(withData: stringResponse) else {
            return completion(false, nil)
        }
     
        guard let responseCode = dataJSON["Brastlewark"] as? [[String: Any]] else{
            return completion(false, nil)
        }
         completion(true,responseCode)
        
    }
}
struct Contants {
    static let colorPink = UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
    static let colorGreen = UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
    static let colorRed = UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
    static let colorGray = UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
    static let colorBlack = UIColor(red: 232.0/255.0, green: 35.0/255.0, blue: 139.0/255.0, alpha: 1)
    static let urlRequest = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
}
