//
//  ViewController.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/2/9.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {
    let provider = MoyaProvider<WeatherService>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonTap(self);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonTap(_ sender: Any) {
        
        provider.request(.forecast("shenzhen")) { result in
            switch result {
            case let .success(response):
                let string = String(data: response.data, encoding: .utf8)
                let json = JSONDecoder.init()
                print(string)
            case let .failure(error):
                print(error)
            }
        }
    }
}

