//
//  TimeFormatter.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/25.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class TimeFormatter: NSObject {

    func format(dateString: String, formatString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter.date(from: dateString)
    }
    
    func format(date: Date, formatString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatString
        return dateFormatter.string(from: date)
    }
    
}
