//
//  ViewController.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/2/9.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var tomorrowItemView: WeatherItemView!
    @IBOutlet weak var afterTomorrowItemView: WeatherItemView!
    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureINtervalLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    
    let provider = MoyaProvider<WeatherService>()
    let mainViewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherIconImageView.tintColor = UIColor.white
        
        tomorrowItemView.dateLabel.text = "明天"
        afterTomorrowItemView.dateLabel.text = "后天"
        
        mainViewModel.requestForecast().subscribe(onNext: { (list) in
            self.setupView(list: list)
        }, onError: { (error) in
            
        }, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
    }
    
    func setupView(list: ForecastList) {
        guard let dailyForecasts = list.forecasts else {
            return
        }
        
        locationButton.setTitle(list.locationInfo?.areaName, for: .normal)
        
        if  let todayForecast = dailyForecasts.first {
            temperatureINtervalLabel.text = todayForecast.minTemperature + "° / " + todayForecast.maxTemperature + "°"
            humidityLabel.text = "温度 " + todayForecast.humidity
            windLabel.text = todayForecast.windDirection + " " + todayForecast.windSpeed + "m/s"
            weatherDescriptionLabel.text = todayForecast.conditionTextDay
            weatherIconImageView.image = UIImage(named: todayForecast.conditionCodeDay)?.withRenderingMode(.alwaysTemplate)
        }
        
        tomorrowItemView.fillView(model: dailyForecasts[1])
        afterTomorrowItemView.fillView(model: dailyForecasts[2])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

