//
//  CityManagerViewController.swift
//  fengqingtianqi
//
//  Created by cjz on 2018/3/25.
//  Copyright © 2018年 ChenJunzhi. All rights reserved.
//

import UIKit

class CityManagerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            CityReader.initCityDataBase()
        }
    }

    
    @IBAction func backButtonTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
