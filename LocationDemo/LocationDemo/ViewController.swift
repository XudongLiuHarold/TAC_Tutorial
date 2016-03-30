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
    
    var locationManger:CLLocationManager?
    var currentLocation:CLLocation?
    var successGetCurrentWeather = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        locationManger?.stopUpdatingLocation()
    }

    @IBAction func startLocate(sender: AnyObject) {
        let authorityStatus = CLLocationManager.authorizationStatus()
        
        if getAuthorizationFromUser(authorityStatus) {
            startStandardLocate()
        }
    }
    @IBAction func stopLocate(sender: AnyObject) {
        self.locationManger?.stopUpdatingLocation()
    }
    
    
    func getAuthorizationFromUser(status: CLAuthorizationStatus) -> Bool {
        var userAgreeUseLocation = false
        
        switch status {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            userAgreeUseLocation = true
            
        case .Denied, .Restricted:
            let alertController = UIAlertController(title: "设备定位权限被禁用", message: "请在设置中打开App的定位功能", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let openAction = UIAlertAction(title: "设置", style: .Default, handler: { (action) -> Void in
                if let url = NSURL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.sharedApplication().openURL(url)
                }
            })
            alertController.addAction(openAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
        case .NotDetermined:
            locationManger = CLLocationManager()
            self.locationManger!.requestWhenInUseAuthorization()
            
            userAgreeUseLocation = true
        }
        return userAgreeUseLocation
    }
    
    func startStandardLocate() {
        if nil == locationManger {
            locationManger = CLLocationManager()
        }
        
        locationManger!.delegate = self
        locationManger!.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        locationManger!.startUpdatingLocation()
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            if nil == self.currentLocation || location.distanceFromLocation(self.currentLocation!) > 10000 {
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
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        getAuthorizationFromUser(status)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        if let locationError = CLError(rawValue: error.code) {
            switch locationError {
            case .LocationUnknown:
                print("无法获得当前位置信息")
            case .Network:
                print("网路异常无法获得定位信息")
            case .Denied:
                print("用户拒绝App使用定位服务")
            default:
                print("其他原因导致App无法使用定位服务")
            }
        }
    }
}

