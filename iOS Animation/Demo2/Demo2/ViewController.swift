//
//  ViewController.swift
//  Demo2
//
//  Created by LRui on 16/4/19.
//  Copyright © 2016年 lirui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var background: UIImageView!
    var welcome: UILabel!
    var username: UITextField!
    var password: UITextField!
    var signin: UIButton!
    
    var alertView: UIView!
    var alertLabel: UILabel!
    var alertButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        background = UIImageView(image: UIImage(named: "1.png"))
        background.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(background)
        
        welcome = UILabel()
        welcome.text = "Welcome"
        welcome.font = UIFont.systemFontOfSize(40)
        welcome.textColor = UIColor.whiteColor()
        welcome.bounds = CGRect(x: 0, y: 0, width: 200, height: 40)
        welcome.textAlignment = .Center
        self.view.addSubview(welcome)
        
        username = UITextField()
        username.delegate = self
        username.font = UIFont.systemFontOfSize(20)
        username.placeholder = "Username"
        username.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        username.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width - 80, height: 40)
        username.layer.cornerRadius = 20
        username.layer.borderColor = UIColor.whiteColor().CGColor
        username.layer.borderWidth = 2
        username.textAlignment = .Center
        username.textColor = UIColor.whiteColor()
        self.view.addSubview(username)
        
        password = UITextField()
        password.delegate = self
        password.font = UIFont.systemFontOfSize(20)
        password.placeholder = "Password"
        password.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        password.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width - 80, height: 40)
        password.layer.cornerRadius = 20
        password.layer.borderColor = UIColor.whiteColor().CGColor
        password.layer.borderWidth = 2
        password.textAlignment = .Center
        password.textColor = UIColor.whiteColor()
        self.view.addSubview(password)
        
        signin = UIButton()
        signin.titleLabel?.font = UIFont.systemFontOfSize(20)
        signin.setTitle("SignIn", forState: .Normal)
        signin.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signin.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width - 80, height: 40)
        signin.layer.cornerRadius = 20
        signin.backgroundColor = UIColor ( red: 0.1956, green: 0.5155, blue: 1.0, alpha: 1.0 )
        self.view.addSubview(signin)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        background.center.x = self.view.center.x
        background.center.y = self.view.center.y
        
        welcome.center = CGPoint(x: self.view.center.x, y: 130)
        
        username.center.x = self.view.center.x - self.view.frame.width
        username.center.y = welcome.center.y + 110
        
        password.center.x = self.view.center.x - self.view.frame.width
        password.center.y = username.center.y + 50
        
        signin.center.x = self.view.center.x
        signin.center.y = password.center.y + 120
        signin.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    /* TextField Delegate */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

