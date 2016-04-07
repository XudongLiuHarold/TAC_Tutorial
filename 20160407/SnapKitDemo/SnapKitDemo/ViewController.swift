//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by FOWAFOLO on 16/3/30.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - ViewController Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
//        original()
//        addLabel()
//        addBox()
//        testEdges()
//        testSize()
//        testCenter()
//        testReadble()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - NSLayoutConstraint布局
    /**
     底部均与分布的两个色块
     */
    func original() {
        
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        // 禁止Autoresizing转为Autolayout的约束
        blueView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blueView)
        
        let redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        redView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(redView)
        
        let blueLeft = NSLayoutConstraint(item: blueView, attribute: .Left, relatedBy: .Equal,
                                          toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 20)
        let blueBottom = NSLayoutConstraint(item: blueView, attribute: .Bottom, relatedBy: .Equal,
                                            toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -20)
        let blueRight = NSLayoutConstraint(item: blueView, attribute: .Right, relatedBy: .Equal,
                                           toItem: redView, attribute: .Left, multiplier: 1.0, constant: -20)
        
        let blueHeight = NSLayoutConstraint(item: blueView, attribute: .Height, relatedBy: .Equal,
                                            toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40)
        
        let equalWidth = NSLayoutConstraint(item: blueView, attribute: .Width, relatedBy: .Equal,
                                            toItem: redView, attribute: .Width, multiplier: 1.0, constant: 0)
        
        let redTop = NSLayoutConstraint(item: redView, attribute: .Top, relatedBy: .Equal,
                                        toItem: blueView, attribute: .Top, multiplier: 1.0, constant: 0)
        
        let redBottom = NSLayoutConstraint(item: redView, attribute: .Bottom, relatedBy: .Equal,
                                           toItem: blueView, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let redRight = NSLayoutConstraint(item: redView, attribute: .Right, relatedBy: .Equal,
                                          toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -20)
        
        self.view.addConstraints([blueLeft, blueBottom, blueRight, blueHeight, equalWidth, redTop, redBottom, redRight])
    }
    
    //MARK: - SnapKit方法布局
    /**
     屏幕中间的label
     使用leading,trailing,center
     */
    func addLabel() {
        let label = UILabel()
        label.text = "Let's play with SnapKit"
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(20)
        label.textColor = UIColor.CustomGreenColor()
        self.view.addSubview(label)
        label.snp_makeConstraints { (make) in
            make.leading.equalTo(self.view.snp_leading)
            make.trailing.equalTo(self.view.snp_trailing)
            make.centerY.equalTo(self.view)
        }
    }
    
    /**
     两种方法在屏幕放置一个和屏幕几乎等大的色块
     分别使用top,bottom,left,right
     */
    func addBox() {
        let box = UIView()
        box.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(box)
        
        /**
         *  Method One
         */
        box.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(superView).offset(20)
            make.left.equalTo(superView).offset(20)
            make.bottom.equalTo(superView).offset(-20)
            make.right.equalTo(superView).offset(-20)
        }
        
        /**
         *  Method Two
         */
//        box.snp_makeConstraints { (make) -> Void in
//            make.edges.equalTo(superView).inset(UIEdgeInsetsMake(20, 20, 20, 20))
//        }
    }
    
    /**
     效果和上面一个类似
     使用edges属性
     */
    func testEdges() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.edges.equalTo(superView).inset(UIEdgeInsetsMake(5, 10, 20, 50))
        }
    }
    
    /**
     使用size属性
     */
    func testSize() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.size.equalTo(superView).offset(CGSizeMake(-100, -50))
        }
    }
    
    /**
     使用center属性
     */
    func testCenter() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.center.equalTo(superView).offset(CGPointMake(-30, 20))
            make.size.equalTo(superView).offset(CGSizeMake(-200, -200))
        }
    }
    
    /**
     更为可读、简易的方式
     */
    func testReadble() {
        let view = UIView()
        view.backgroundColor = UIColor.CustomGreenColor()
        let superView = self.view
        superView.addSubview(view)
        view.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(superView)
            make.top.equalTo(superView).offset(100)
        }
    }
}

//MARK: - Custom UIColor
extension UIColor {
    class func CustomGreenColor() -> UIColor {
        return UIColor(red: 36/255, green: 169/255, blue: 255/255, alpha: 1.0)
    }
}