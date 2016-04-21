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
    var img2: UIImageView!
    var v: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        img1 = UIImageView(image: UIImage(named: "1.jpg"))
        img1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(img1)
        
        v = CALayer()
        v.bounds = CGRect(x: 0, y: 0, width: self.view.frame.height + 100, height: self.view.frame.height + 100)
        v.backgroundColor = UIColor.clearColor().CGColor
        v.position = self.view.center
        v.borderColor = UIColor.whiteColor().CGColor
        v.borderWidth = (self.view.frame.height + 100) / 2
        v.cornerRadius = (self.view.frame.height + 100) / 2
        img1.layer.addSublayer(v)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        v.borderWidth = 0
    }
}

