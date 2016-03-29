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
        // Do any additional setup after loading the view, typically from a nib.
//        WeatherModel().getWeather(39.93, lon: 116.40) { (cityName, weatherInfo) -> Void in
//            print(cityName)
//            print(weatherInfo)
//        }
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
        print("size:\(locations.count)")
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
}
