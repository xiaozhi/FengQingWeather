//
//  AccountService.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/2/9.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import Foundation
import Moya

let BaseURL = "https://free-api.heweather.com";


enum WeatherService {
    case forecast(String)
    case now(String)
}

extension WeatherService: TargetType {
    var baseURL: URL {
        return URL(string: BaseURL)!
    }
    
    var path: String {
        switch self {
        case .forecast:
            return "/s6/weather/forecast"
        
        case .now:
            return "weather/now"
        }
    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    
    var task: Task {
        switch self {
        case .forecast(let city):
            return .requestParameters(parameters: ["location": city, "key": ServiceKey], encoding: URLEncoding.default)
        case . now(let city):
            return .requestParameters(parameters: ["location": city, "key": ServiceKey], encoding: URLEncoding.default)
        }
        
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
