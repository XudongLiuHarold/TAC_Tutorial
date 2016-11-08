//
//  ViewController.swift
//  LocationDemo
//
//  Created by Teng on 3/29/16.
//  Copyright © 2016 huoteng. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    
    @IBOutlet weak var longitudeLable: UILabel!
    @IBOutlet weak var latitudeLable: UILabel!
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var weatherDescLable: UILabel!
    
    var locationManager:CLLocationManager?
    var currentLocation:CLLocation?
    var successGetCurrentWeather = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //在用户离开当前页面后停止定位
        locationManager?.stopUpdatingLocation()
    }

    @IBAction func startLocate(_ sender: AnyObject) {
        let authorityStatus = CLLocationManager.authorizationStatus()
        
        //检查定位权限通过后开始配置locationManager
        if getAuthorizationFromUser(authorityStatus) {
            startStandardLocate()
        }
    }
    
    @IBAction func stopLocate(_ sender: AnyObject) {
        self.locationManager?.stopUpdatingLocation()
    }
    
    //检查App的定位权限
    func getAuthorizationFromUser(_ status: CLAuthorizationStatus) -> Bool {
        var userAgreeUseLocation = false
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            userAgreeUseLocation = true
            
        case .denied, .restricted://当定位权限被禁用或是无法获得定位信息时给用户一个Alert弹窗提示，并引导用户到设置中打开定位功能
            let alertController = UIAlertController(title: "设备定位权限被禁用", message: "请在设置中打开App的定位功能", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let openAction = UIAlertAction(title: "设置", style: .default, handler: { (action) -> Void in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.openURL(url)
                }
            })
            alertController.addAction(openAction)
            self.present(alertController, animated: true, completion: nil)
            
        case .notDetermined://当定位权限还没有明确时需要向用户申请定位权限，具体申请哪一种权限要根据应用的具体功能来确定
            locationManager = CLLocationManager()
            
            //在这里向用户申请在App使用时获得定位的权限
            self.locationManager!.requestWhenInUseAuthorization()
            
            userAgreeUseLocation = true
        }
        return userAgreeUseLocation
    }
    
    //实例化locationManager并配置，设置delegate后开始定位
    func startStandardLocate() {
        if nil == locationManager {
            locationManager = CLLocationManager()
        }
        
        locationManager!.delegate = self
        
        //设置定位精度，并设置distanceFilter为5米
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        locationManager!.distanceFilter = 5
        
        locationManager!.startUpdatingLocation()
    }

    //获取定位数据的delegate函数
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if nil == self.currentLocation || location.distance(from: self.currentLocation!) > 10000 {
                self.currentLocation = location
                
                let lat = Double(location.coordinate.latitude)
                let lon = Double(location.coordinate.longitude)
                
                WeatherModel().getWeather(lat, lon: lon, resultHandler: { (cityName, weatherDesc) -> Void in
                    self.cityLable.text = cityName
                    self.weatherDescLable.text = weatherDesc
                    self.successGetCurrentWeather = true
                })
            }
            
            self.latitudeLable.text = "\(location.coordinate.latitude)"
            self.longitudeLable.text = "\(location.coordinate.longitude)"
        }
    }
    
    //当用户更改定位权限时重新检查App定位权限状态
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        _ = getAuthorizationFromUser(status)
    }
    
    //定位失败时根据不同的原因向用户返回相应的信息，这里只是将信息打印在了控制台中
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let locationError = CLError.Code(rawValue: error._code) {
            switch locationError {
            case .locationUnknown:
                print("无法获得当前位置信息")
            case .network:
                print("网路异常无法获得定位信息")
            case .denied:
                print("用户拒绝App使用定位服务")
            default:
                print("其他原因导致App无法使用定位服务")
            }
        }
    }
}

