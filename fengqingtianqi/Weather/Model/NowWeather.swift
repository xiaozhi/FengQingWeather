//
//  NowWeather.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/12.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class NowWeatherWapper: BaseModel {
    var nowWeather: NowWeather?
    
    enum CodingKeys: String, CodingKey {
        case nowWeather = "now"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        nowWeather = try container.decode(NowWeather.self, forKey: .nowWeather)
    }
}

/// 实况天气Model
class NowWeather: Codable{
    var condCode: String!
    var condText: String!
    
    /// 体感温度
    var feelTemperature: String!
    
    var temperature: String!
    
    var windAngle: String!
    var windDirect: String!
    var windPower: String!
    var windSpeed: String!
    
    /// 温度
    var hum: String!
    
    var precipitation: String!
    var atmosphericPressure: String!
    var visibility: String!
    
    /// 云量
    var cloud: String!
    
    enum CodingKeys: String, CodingKey {
        case condCode = "cond_code"
        case condText = "cond_txt"
        case feelTemperature = "fl"
        case temperature = "tmp"
        case windAngle = "wind_deg"
        case windDirect = "wind_dir"
        case windPower = "wind_sc"
        case windSpeed = "wind_spd"
        case hum = "hum"
        case precipitation = "pcpn"
        case atmosphericPressure = "pres"
        case visibility = "vis"
        case cloud = "cloud"
    }
}
