//
//  ViewController.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/2/9.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    let provider = MoyaProvider<WeatherService>()
    
    let mainViewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mainViewModel.requestForecast().map { (forecastList) -> String? in
//            return forecastList.locationInfo?.parentCity
//        }.bind(to: temputureLabel.rx.text).disposed(by: disposeBag)
        
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

