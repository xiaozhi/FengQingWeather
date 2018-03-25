//
//  Forecast.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/8.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import Foundation

/// 天气预测列表
class ForecastList: BaseModel {
    var forecasts: [DailyForecast]?
    
    private enum CodingKeys: String, CodingKey {
        case forecasts = "daily_forecast"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        forecasts = try container.decode([DailyForecast].self, forKey: .forecasts)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(forecasts, forKey: .forecasts)
    }
}

/// 每天的预测
class DailyForecast: Codable {
    var date: String!
    
    var sunRise: String!
    var sunSet: String!
    var moonRise: String!
    var moonSet: String!
    
    var maxTemperature: String!
    var minTemperature: String!
    
    var conditionCodeDay: String!
    var conditionCodeNight: String!
    var conditionTextDay: String!
    var conditionTextNight: String!
    
    var windAngle: String
    var windDirection: String!
    var windPower: String!
    var windSpeed: String!
    
    var humidity: String! //相对湿度
    var pcpn: String! //降水量
    var pop: String! //降水概率
    var pres: String! //大气压强
    var uvIndex: String! //紫外线强度指数
    var vis: String! //能见度
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        
        case sunRise = "sr"
        case sunSet = "ss"
        case moonRise = "mr"
        case moonSet = "ms"
        case maxTemperature = "tmp_max"
        case minTemperature = "tmp_min"
        case conditionCodeDay = "cond_code_d"
        
        case conditionCodeNight = "cond_code_n"
        case conditionTextDay = "cond_txt_d"
        case conditionTextNight = "cond_txt_n"
        case windAngle = "wind_deg"
        case windDirection = "wind_dir"
        case windPower = "wind_sc"
        case windSpeed = "wind_spd"
        
        case humidity = "hum"
        case pcpn = "pcpn"
        case pop = "pop"
        case pres = "pres"
        case uvIndex = "uv_index"
        case vis = "vis"
        
    }
    
}
