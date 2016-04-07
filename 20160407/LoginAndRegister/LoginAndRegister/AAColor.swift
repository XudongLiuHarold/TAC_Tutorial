//
//  AAColor.swift
//  LoginAndRegister
//
//  Created by FOWAFOLO on 16/4/7.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit

extension UIColor {
    class func GlobalRedColor() -> UIColor {
        return UIColor ( red: 0.7451, green: 0.0667, blue: 0.2196, alpha: 1.0 )
    }
    class func GlobalGray() -> UIColor {
        return UIColor(red: 0.6824, green: 0.702, blue: 0.7373, alpha: 1.0)
    }
    
    class func GlobalMenuBlack() -> UIColor {
        return UIColor ( red: 0.0627, green: 0.0471, blue: 0.051, alpha: 1.0 )
    }
    
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}