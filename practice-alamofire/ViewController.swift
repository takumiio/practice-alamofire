//
//  ViewController.swift
//  practice-alamofire
//
//  Created by Nishimura Takumi on 3/8/17.
//  Copyright © 2017 Nishimura Takumi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
            
            let j = JSON(response.result.value)
            print("origin: \(j["origin"])")
            
        }
 */
        
        Alamofire.request("https://7a97uho3bh.execute-api.ap-northeast-1.amazonaws.com/test/mydemoresource").responseJSON(completionHandler: { response in
            print("MY AWS's API")
            let json = JSON(response.result.value)
            print("json: \(json)")
        })
        
        let params: Parameters = ["name": "Takumi Nishimura with Alamofire!!"]
        Alamofire.request("https://7a97uho3bh.execute-api.ap-northeast-1.amazonaws.com/test/mydemoresource", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            print("POST MY AWS's API")
            let json = JSON(response.result.value)
            print("Hoge~~: \(json)")
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

