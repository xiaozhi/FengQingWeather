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

enum HFError: Error {
    case test
}

class MainViewModel: NSObject {
    let weatherService = MoyaProvider<WeatherService>()

    func requestForecast() -> Observable<ForecastList>{
        return weatherService.rx.request(.forecast("shenzhen")).asObservable().mapModel(type: ForecastList.self)
    }
    
    func requestNowWeather() -> Observable<NowWeatherWapper> {
        return weatherService
            .rx.request(.now("shenzhen"))
            .asObservable()
            .mapModel(type: NowWeatherWapper.self)
    }
    
}
