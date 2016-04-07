//
//  SignupViewController.swift
//  LoginAndRegister
//
//  Created by FOWAFOLO on 16/4/7.
//  Copyright © 2016年 TAC. All rights reserved.
//

import UIKit

class SingUpViewController: UIViewController, UITextFieldDelegate {
    
    var background        = UIImageView()
    let signUpLabel       = UILabel()
    let avator            = UIImageView()
    let usernameTextField = UITextField()
    let phoneNumTextField = UITextField()
    let passwordTextField = UITextField()
    let arrowButton       = UIButton()
    var superView         = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        superView = self.view
        initUIComponents()
    }
    
    func initUIComponents() {
        background.frame = superView.frame
        background.image = UIImage(named: "loginBack")
        superView.addSubview(background)
        
        signUpLabel.text      = "Sign Up"
        signUpLabel.textColor = UIColor.GlobalRedColor()
        signUpLabel.font      = UIFont.boldSystemFontOfSize(30)
        superView.addSubview(signUpLabel)
        signUpLabel.snp_makeConstraints { (make) in
            make.top.equalTo(superView).offset(40)
            make.centerX.equalTo(superView)
        }
        
        avator.image = UIImage(named: "avator")
        superView.addSubview(avator)
        avator.snp_makeConstraints { (make) in
            make.top.equalTo(signUpLabel.snp_bottom).offset(40)
            make.width.height.equalTo(120)
            make.centerX.equalTo(superView)
        }
        avator.layer.cornerRadius = 60 // width /2
        avator.clipsToBounds = true
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "User Name", attributes: [NSForegroundColorAttributeName:UIColor.GlobalGray()])
        usernameTextField.textColor = UIColor.GlobalGray()
        usernameTextField.textAlignment = .Center
        usernameTextField.delegate = self
        superView.addSubview(usernameTextField)
        usernameTextField.snp_makeConstraints { (make) in
            make.top.equalTo(avator.snp_bottom).offset(72)
            make.leading.equalTo(superView).offset(50)
            make.trailing.equalTo(superView).offset(-50)
        }
        
        let line1 = UIView()
        line1.backgroundColor = UIColor.GlobalRedColor()
        superView.addSubview(line1)
        line1.snp_makeConstraints { (make) in
            make.top.equalTo(usernameTextField.snp_bottom).offset(5)
            make.leading.trailing.equalTo(usernameTextField)
            make.height.equalTo(1.5)
        }
        
        let line2 = UIView()
        line2.backgroundColor = UIColor.GlobalRedColor()
        superView.addSubview(line2)
        line2.snp_makeConstraints { (make) in
            make.top.equalTo(line1.snp_bottom).offset(70)
            make.height.leading.trailing.equalTo(line1)
        }
        
        phoneNumTextField.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSForegroundColorAttributeName:UIColor.GlobalGray()])
        phoneNumTextField.textColor     = UIColor.GlobalGray()
        phoneNumTextField.textAlignment = .Center
        phoneNumTextField.delegate      = self
        superView.addSubview(phoneNumTextField)
        phoneNumTextField.snp_makeConstraints { (make) in
            make.bottom.equalTo(line2.snp_top).offset(-5)
            make.leading.trailing.equalTo(usernameTextField)
        }
        
        let line3 = UIView()
        line3.backgroundColor = UIColor.GlobalRedColor()
        superView.addSubview(line3)
        line3.snp_makeConstraints { (make) in
            make.top.equalTo(line2.snp_bottom).offset(70)
            make.height.leading.trailing.equalTo(line1)
        }
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName:UIColor.GlobalGray()])
        passwordTextField.textAlignment         = .Center
        passwordTextField.delegate              = self
        superView.addSubview(passwordTextField)
        passwordTextField.snp_makeConstraints { (make) in
            make.bottom.equalTo(line3.snp_top).offset(-5)
            make.trailing.leading.equalTo(usernameTextField)
        }
        
        arrowButton.setImage(UIImage(named: "arrow"), forState: .Normal)
        superView.addSubview(arrowButton)
        arrowButton.snp_makeConstraints { (make) in
            make.width.height.equalTo(46)
            make.top.equalTo(line3.snp_bottom).offset(45)
            make.centerX.equalTo(superView)
        }
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        usernameTextField.resignFirstResponder()
        phoneNumTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
}
