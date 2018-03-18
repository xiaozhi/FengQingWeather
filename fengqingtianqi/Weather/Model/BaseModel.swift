//
//  BaseModel.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/18.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class BaseModel: Codable {
    
    var locationInfo: LocationInfo?
    var status: String!
    
    private enum CodingKeys: String, CodingKey {
        case locationInfo = "basic"
        case status = "status"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        locationInfo = try container.decode(LocationInfo.self, forKey: .locationInfo)
        status = try container.decode(String.self, forKey: .status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(locationInfo, forKey: .locationInfo)
        try container.encode(status, forKey: .status)
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
