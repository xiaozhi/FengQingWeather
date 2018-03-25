//
//  WeatherItemView.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/18.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit
import SnapKit

class WeatherItemView: UIView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var dayImageView: UIImageView!
    @IBOutlet weak var nightImageView: UIImageView!
    @IBOutlet weak var dayWeatherLabel: UILabel!
    @IBOutlet weak var nightWeatherLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let loadView = Bundle.main.loadNibNamed("WeatherItemView", owner: self, options: nil)?.first  as! UIView
        
        loadView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        
        addSubview(loadView)
        loadView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        dayImageView.tintColor = UIColor.white
        nightImageView.tintColor = UIColor.white
    }
    
    func fillView(model : DailyForecast) {
        dayImageView.image = UIImage(named: model.conditionCodeDay)?.withRenderingMode(.alwaysTemplate)
        dayWeatherLabel.text = model.conditionTextDay
        nightImageView.image = UIImage(named: model.conditionCodeNight)?.withRenderingMode(.alwaysTemplate)
        nightWeatherLabel.text = model.conditionTextNight
        windLabel.text = model.windDirection + " " + model.windSpeed + "km/s"
    }
}
