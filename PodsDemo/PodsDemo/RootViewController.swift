//
//  RootViewController.swift
//  PodsDemo
//
//  Created by  Harold LIU on 3/16/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit
import RESideMenu

class RootViewController: RESideMenu,RESideMenuDelegate{

    override func awakeFromNib() {

        
        contentViewController = storyboard?.instantiateViewControllerWithIdentifier("contentViewController")
        leftMenuViewController = storyboard?.instantiateViewControllerWithIdentifier("leftMenuViewController")
        backgroundImage = UIImage(named: "Stars")
    }
    
    
}
