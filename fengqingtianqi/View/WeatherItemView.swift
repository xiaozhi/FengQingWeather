//
//  WeatherItemView.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/18.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit


class WeatherItemView: UIView {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var dayImageView: UIImageView!
    @IBOutlet weak var nightImageView: UIImageView!
    @IBOutlet weak var dayWeatherLabel: UILabel!
    @IBOutlet weak var nightWeatherLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
//        let view = UINib.init(nibName: "WeatherItenView", bundle: nil)
        let view = Bundle.main.loadNibNamed("WeatherIntemView", owner: self, options: nil)
        
    }
    
    func fillView(model : DailyForecast) {
        dayImageView.image = UIImage(named: model.conditionCodeDay)
        dayWeatherLabel.text = model.conditionTextDay
        nightImageView.image = UIImage(named: model.conditionCodeNight)
        nightWeatherLabel.text = model.conditionTextNight
        
        windLabel.text = model.windDirection + " " + model.windSpeed + "km/s"
    }
}
