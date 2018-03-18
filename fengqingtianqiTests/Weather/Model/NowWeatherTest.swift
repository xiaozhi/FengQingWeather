//
//  NowWeatherTest.swift
//  fengqingtianqiTests
//
//  Created by cjz on 2018/3/12.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import XCTest
@testable import fengqingtianqi

class NowWeatherTest: XCTestCase {
    
    func testJSONParse() {
        let jsonString = """
        {
            "basic": {
                "cid": "CN101010100",
                "location": "北京",
                "parent_city": "北京",
                "admin_area": "北京",
                "cnty": "中国",
                "lat": "39.90498734",
                "lon": "116.40528870",
                "tz": "8.0"
            },
            "now": {
                "cond_code": "101",
                "cond_txt": "多云",
                "fl": "16",
                "hum": "73",
                "pcpn": "0",
                "pres": "1017",
                "tmp": "14",
                "vis": "1",
                "wind_deg": "11",
                "wind_dir": "北风",
                "wind_sc": "微风",
                "wind_spd": "6"
            },
            "status": "ok",
            "update": {
                "loc": "2017-10-26 17:29",
                "utc": "2017-10-26 09:29"
            }
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        do {
            let nowWeather = try JSONDecoder().decode(NowWeatherWapper.self, from: jsonData)
            XCTAssert(nowWeather.nowWeather?.atmosphericPressure != nil, "NowWeather json parse fail")
        } catch {
            XCTFail("NowWeather json parse fail")
        }
    }
    
}
