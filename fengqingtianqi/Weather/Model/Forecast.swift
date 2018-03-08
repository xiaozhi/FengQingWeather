//
//  Forecast.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/8.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import Foundation

/// 天气预测列表
class ForecastList: Codable {
    var locationInfo: LocationInfo?
    var forecasts: [DailyForecast]?
    var status: String!
    
    enum CodingKeys: String, CodingKey {
        case locationInfo = "basic"
        case forecasts = "daily_forecast"
        case status = "status"
    }
}

class LocationInfo: Codable {
    var cityID: String!
    var areaName: String!
    var parentCity: String!
    var adminArea: String! //行政区域
    var country: String!
    var timeZone: String!
    
    enum CodingKeys: String, CodingKey {
        case cityID = "cid"
        case areaName = "location"
        case parentCity = "parent_city"
        case adminArea = "admin_area"
        case country = "cnty"
        case timeZone = "tz"
    }
}


/// 每天的预测
class DailyForecast: Codable {
    var date: String!
    
    var sunRise: String!
    var sunSet: String!
    var moonRise: String!
    var moonSet: String!
    
    var maxTemperature: Int!
    var minTemperature: String!
    
    var conditionCodeDay: String!
    var conditionCodeNight: String!
    var conditionTextDay: String!
    var conditionTextNight: String!
    
    var windAngle: Int!
    var windDirection: String!
    var windPower: String!
    var windSpeed: String!
    
    var humidity: Int! //相对湿度
    var pcpn: Int! //降水量
    var pop: Int! //降水概率
    var pres: Int! //大气压强
    var uvIndex: Int! //紫外线强度指数
    var vis: Int! //能见度
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        
        case sunRise = "sr"
        case sunSet = "ss"
        case moonSet = "ms"
        case maxTemperature = "tmp_max"
        case minTemperature = "tmp_min"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let maxString = try values.decode(String.self, forKey: .maxTemperature)
        maxTemperature = Int(maxString)
    }
    
}
