//
//  ServiceCall.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/31/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import Foundation
import UIKit


class ServiceCall: NSObject {
      private let response = GeneralMethods()
    
     func initWithURl(completion: @escaping(_ success: Bool, _ object: Any?) -> Void) {
        
        let request = NSMutableURLRequest(url: NSURL(string: Contants.urlRequest)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 15.0)
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                completion(false, nil)
            } else {
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
//                print(dataString!)
                let datas = dataString?.data(using: .utf8)
                let json: NSDictionary = try! JSONSerialization.jsonObject(with: datas!) as! NSDictionary
                self.response.parseGetGnomes(stringResponse: dataString!, completion: completion)
                
                
            }
        })
        
        dataTask.resume()
    }
}

