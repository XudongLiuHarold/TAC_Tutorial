#CoreLocation Demo
在这个demo中我们会使用CoreLocation获取用户的地理位置信息。然后使用OpenWeather的天气API获得天气数据显示在页面上。

##获取地理位置信息
####CoreLocation
* CoreLocation在iOS系统中提供地理位置信息的接口，它和用户界面无关，可以获取当前设备的地理位置
* CoreLocation提供三种定位服务
 * 地理位置显著变化服务：提供了一种低功耗的方式来获得当前位置，并在发生重大位置变化时发出通知
 * 标准位置服务：提供了一个高度可配置的获得当前位置和追踪位置变化的服务
 * 区域监测：监测是否出入定义的地理位置区域和蓝牙低功耗信标(Beacon)地区。
* CoreLocation定位精度：使用不同的定位方式其定位精度也各不相同，实现定位的方式有GPS，Wi-Fi，基站等，每种定位方式都会受到信号强度的影响，同时不同的定位方式的耗电量也有巨大差别，这一点需要尤其注意，选择合适的定位方式和精度可以有更好的用户体验。
* 标准位置服务的定位精度如下：
 * kCLLocationAccuracyBestForNavigation(导航用且通常在接入电源的情况下使用，GPS定位，耗电量最高)
 * kCLLocationAccuracyBest(最高精度，GPS定位)
 * kCLLocationAccuracyNearestTenMeters(精度在十米范围内，GPS、Wi-Fi混合定位)
 * kCLLocationAccuracyHundredMeters(精度在100米范围内，Wi-Fi定位)
 * kCLLocationAccuracyKilometer(精度在1000米范围内)
 * KCLLocationAccuracyThreeKilometers(精度在3000米范围内，基站定位)

####CLLocation
 
 我们通过CoreLocation获取到的数据封装在CLLocation中，CLLocation可以提供的信息如下：
 
 * 经纬度(准确度取决于定位精度)
 * 运动速率(米/秒，瞬时速度)
 * 海拔(米)
 * 方向(0-360，0表示北方，顺时针旋转)
 * 时间戳(位置获取时间)

####CLLocationManager使用步骤
 
我们通过CLLocationManager获取地理位置信息，使用CLLocationManager的基本步骤有以下几步：
 
* 1.检查App定位服务权限状态
* 2.检测所需要的定位服务是否可用
* 3.实例化locationManager，根据定位监听的类型来配置locationManager并设置delegate来接收更新
* 4.为locationManager开启监听，获取定位数据

接下来具体介绍一下使用CLLocationManager每一步的具体方法

###1.检查定位服务权限
调用CLLocationManager的类方法去检查定位权限
```swift
CLLocationManager.authorizationStatus()
```

####在iOS中定位服务的权限分为五种，分别为：
* AuthorizedAlways(允许App在使用时和后台运行时都可以使用定位服务)
* AuthorizedWhenInUse(允许App在使用时使用定位服务)
* Denied(不允许App使用定位服务)
* NotDetermined(用户还没有决定允许App使用定位权限，这时需要向用户申请权限)
* Restricted(由于某种原因定位服务被限制使用，例如说处于飞行模式)

####在向用户申请定位权限时需要给用户相应的提示，说明我们的App需要使用定位服务来干什么，所以需要在Info.plist文件中加入两个字段
* NSLocationWhenInUseUsageDescription(向用户申请在App使用时的定位权限的提示信息)
* NSLocationAlwaysUsageDescription(向用户申请后台定位权限时的提示信息)

###2.检测所需要的定位服务是否可用
用户可能在使用iOS设备时关闭定位服务，或者在设置中关闭App的定位权限，或者设备处于飞行模式或硬件故障，有的设备也不支持GPS定位，所以我们需要在开始定位前判断设备的服务是否可用。

* 设备是否支持标准位置服务

```swift
CLLocationManager.locationServicesEnabled() -> Bool
```

* 设备是否支持地理位置显著变化服务

```swift
CLLocationManager.significantLocationChangeMonitoringAvailable() -> Bool
```

* 设备是否支持获取方向信息(在某些情况下，比如说磁场干扰，我们可以获得定位信息，但不一定可以获得设备当前方向)

```swift
CLLocationManager.headingAvailable() -> Bool
```

* 设备是否支持区域监听服务
 
```swift
CLLocationManager.isMonitoringAvailableForClass（regionClass: AnyClass) -> Bool
```

* 设备是否支持iBeacon服务

```swift
CLLocationManager.isRangingAvailable() -> Bool
```

###3.配置locationManager并开始定位服务

locationManager需要配置的信息有定位精度，最小刷新距离和delegate，设置好这几项后就可以开始定位了。

###4.获取定位信息
locationManager开始定位后所有的定位信息都是在delegate中刷新，所以我们是在回调函数中获取到当前的定位信息，这里我们使用标准定位服务，下面的代码展示的就是获取标准定位服务的定位信息

```swift
func locationManager(manager: CLLocationManager, didUpdateLocaitons locations: [CLLocation]) {
	if let location = locaitons.last {
		print("latitude:\(location.coordinate.latitude)")
		print("latitude:\(location.coordinate.longitude)")
	}
}
```

完成上面的步骤后我们可以正常获取到用户的定位数据了，但是为了更好的用户体验，我们需要配置更多的delegate函数在定位发生异常时给用户提示

####locationManager定位失败时delegate会调用该函数通知App
```swift
func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
	if let locationError = CLError(rawValue: error.code) {
		switch locationError {
		case .LocationUnknown:
			print("无法获得当前定位")
		case .Network:
			print("网络异常，无法获得当前定位")
		case .Denied:
			print("用户拒绝App使用定位服务")
		default:
			print("其他原因导致无法使用定位服务")
		}
	}
}
```


> 更多的函数你可以在CLLocationManagerDelegate中找到，每一个函数都有详细的说明


====
####完整的代码请打开项目文件在[ViewController.swift](https://github.com/xdliu002/TAC_communication/blob/master/LocationDemo/LocationDemo/ViewController.swift)中查看
Copyright 2016 &copy; Teng

