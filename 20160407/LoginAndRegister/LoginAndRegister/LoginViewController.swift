//
//  LoginViewController.swift
//  LoginAndRegister
//
//  Created by FOWAFOLO on 16/4/7.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    //MARK: - UI Components
    var superView = UIView()
    
    let backgroundImage = UIImageView()
    let logoImage = UIImageView()
    let logoLabel = UILabel()
    
    let userIcon = UIImageView()
    let userText = UITextField()
    
    let passIcon = UIImageView()
    let passText = UITextField()
    
    let loginButton = UIButton()
    
    let wechatButton = UIButton()
    let weboButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        superView = self.view
        //TODO: configure UI
        configeUI()
    }
    
    //MARK: - Functions
    func configeUI() {
        //MARK: backgroundImage
        backgroundImage.image = UIImage(named: "loginBack")
        superView.addSubview(backgroundImage)
        backgroundImage.snp_makeConstraints { (make) in
//            make.left.right.top.bottom.equalTo(superView)
            make.size.equalTo(superView)
            make.center.equalTo(superView)
        }
        
        //MARK: logoImage
        logoImage.image = UIImage(named: "Logo-LoginView")
        superView.addSubview(logoImage)
        logoImage.snp_makeConstraints { (make) in
            make.top.equalTo(superView).offset(61)
            make.width.height.equalTo(140)
            make.centerX.equalTo(superView)
        }
        // superView.bringSubviewToFront(logoImage)
        
        //MARK: logoLabel
        logoLabel.text = "Carols"
        logoLabel.textColor = UIColor.GlobalRedColor()
        logoLabel.font = UIFont.systemFontOfSize(30)
        superView.addSubview(logoLabel)
        logoLabel.snp_makeConstraints { (make) in
            make.top.equalTo(logoImage.snp_bottom).offset(3)
            make.centerX.equalTo(superView)
        }
        
        userIcon.image = UIImage(named: "user")
        passIcon.image = UIImage(named: "lock")
        
//        userText.placeholder = "Phone Number"
        userText.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSForegroundColorAttributeName: UIColor.GlobalGray()])
        userText.textAlignment = .Center
        superView.addSubview(userText)
        userText.snp_makeConstraints { (make) in
            make.top.equalTo(logoLabel.snp_bottom).offset(51)
            make.centerX.equalTo(superView)
            make.left.equalTo(superView).offset(100)
            make.right.equalTo(superView).offset(-100)
        }
        
        superView.addSubview(userIcon)
        userIcon.snp_makeConstraints { (make) in
            make.width.height.equalTo(24)
            make.right.equalTo(userText.snp_left).offset(-5)
            make.centerY.equalTo(userText)
        }
        
        let line1 = UIView()
        line1.backgroundColor = UIColor.GlobalRedColor()
        superView.addSubview(line1)
        line1.snp_makeConstraints { (make) in
            make.height.equalTo(1.5)
            make.left.equalTo(userIcon).offset(-5)
            make.right.equalTo(userText).offset(5)
            make.top.equalTo(userIcon.snp_bottom).offset(5)
        }
        
//        passText.placeholder = "Password"
        passText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.GlobalGray()])
        passText.textAlignment = .Center
        superView.addSubview(passText)
        passText.snp_makeConstraints { (make) in
            make.top.equalTo(line1.snp_bottom).offset(26)
            make.centerX.equalTo(superView)
            make.left.equalTo(superView).offset(100)
            make.right.equalTo(superView).offset(-100)
        }
        
        superView.addSubview(passIcon)
        passIcon.snp_makeConstraints { (make) in
            make.width.height.equalTo(24)
            make.right.equalTo(userText.snp_left).offset(-5)
            make.centerY.equalTo(passText)
        }
        
        let line2 = UIView()
        line2.backgroundColor = UIColor.GlobalRedColor()
        superView.addSubview(line2)
        line2.snp_makeConstraints { (make) in
            make.height.width.centerX.equalTo(line1)
            make.top.equalTo(passIcon.snp_bottom).offset(5)
        }

        loginButton.setTitle("Login", forState: .Normal)
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = UIColor.GlobalRedColor()
        loginButton.addTarget(self, action: #selector(LoginViewController.loginButtonClicked), forControlEvents: .TouchUpInside)
        superView.addSubview(loginButton)
        loginButton.snp_makeConstraints { (make) in
            make.top.equalTo(line2.snp_bottom).offset(70)
            make.centerX.equalTo(superView)
            make.height.equalTo(35)
            make.width.equalTo(119)
        }
        
        let loginDescription = UILabel()
        loginDescription.text = "Login By"
        loginDescription.textColor = UIColor.grayColor()
        superView.addSubview(loginDescription)
        loginDescription.snp_makeConstraints { (make) in
            make.top.equalTo(loginButton.snp_bottom).offset(44)
            make.centerX.equalTo(superView)
        }
        
        wechatButton.setImage(UIImage(named: "wechat"), forState: .Normal)
        superView.addSubview(wechatButton)
        wechatButton.snp_makeConstraints { (make) in
            make.right.equalTo(superView.snp_centerX).offset(-7.5)
            make.top.equalTo(loginDescription.snp_bottom).offset(36)
            make.height.equalTo(44)
            make.width.equalTo(55)
        }
        
        weboButton.setImage(UIImage(named: "weibo"), forState: .Normal)
        superView.addSubview(weboButton)
        weboButton.snp_makeConstraints { (make) in
            make.height.width.top.equalTo(wechatButton)
            make.left.equalTo(superView.snp_centerX).offset(7.5)
        }
    }
    
    func loginButtonClicked() {
        print("loginButtonClicked")
    }

}

