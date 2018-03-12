//
//  MainViewModel.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/10.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class MainViewModel: NSObject {
    let weatherService = MoyaProvider<WeatherService>()
    
    func requestForecast() -> Observable<ForecastList>{
        return weatherService.rx.request(.forecast("shenzhen")).asObservable().mapModel(type: ForecastList.self)
    }
    
}
