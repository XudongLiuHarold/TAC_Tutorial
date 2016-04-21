//
//  ViewController.swift
//  Demo1
//
//  Created by LRui on 16/4/19.
//  Copyright © 2016年 lirui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var img1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        img1 = UIImageView(image: UIImage(named: "1.jpg"))
        img1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

