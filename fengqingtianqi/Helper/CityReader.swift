//
//  CityReader.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/25.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class CityReader {

    class func initCityDataBase() {
        let path = Bundle.main.path(forResource: "china-city-list", ofType: ".txt")
        guard let text = try? String(contentsOfFile: path!, encoding: .utf8) else {
            return
        }
        
        let lines = text.components(separatedBy: "\r")
        _ = lines.flatMap({ (line) -> City? in
            let item = line.components(separatedBy: "\t")
            if item.count < 12 {
                return nil
            }
            print(line)
            return City(code: item[0], name: item[2], provice: item[7], area: item[9], adCode: item[12])
        })
    }
    
    func readCitys(fromFile file: URL) -> [City]? {
        
        
        return nil
    }
    
}


