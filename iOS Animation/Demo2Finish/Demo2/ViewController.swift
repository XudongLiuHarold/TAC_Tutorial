//
//  ViewController.swift
//  Demo
//
//  Created by LRui on 16/4/18.
//  Copyright © 2016年 lirui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var background: UIImageView!
    var welcome: UILabel!
    var username: UITextField!
    var password: UITextField!
    var signin: UIButton!
    var signinDisabled = false
    var alert: UIView!
    var alertLabel: UILabel!
    var alertButton: UIButton!
    var shadow: CALayer!
    
    /* View Function */
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        password.placeholder = "Username"
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
        signin.addTarget(self, action: #selector(ViewController.login(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(signin)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        background.center.x = self.view.center.x
        background.center.y = self.view.center.y
        
        welcome.center = CGPoint(x: self.view.center.x, y: -80)
        
        username.center.x = self.view.center.x - self.view.frame.width
        username.center.y = welcome.center.y + 390
        
        password.center.x = self.view.center.x - self.view.frame.width
        password.center.y = username.center.y + 50
        
        signin.center.x = self.view.center.x
        signin.center.y = password.center.y + 130
        signin.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(2, delay: 0, options: .CurveEaseIn, animations: {
                let scale = CGAffineTransformMakeScale(1.05, 1.05)
                self.background.transform = scale
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0, options: .CurveEaseInOut, animations: { 
                self.welcome.center.y += 270
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0, options: .CurveEaseInOut, animations: { 
                self.username.center.x += self.view.frame.width
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: .CurveEaseInOut, animations: {
            self.password.center.x += self.view.frame.width
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: .CurveEaseInOut, animations: { 
                self.signin.center.y -= 40
                self.signin.alpha = 1
            }, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func login(sender: UIButton) {
        if !signinDisabled {
            shadow = CALayer()
            shadow.bounds = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            shadow.position = self.view.center
            shadow.backgroundColor = UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4 ).CGColor
            self.view.layer.addSublayer(shadow)
            
            alert = UIView()
            alert.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
            alert.center = self.view.center
            alert.layer.cornerRadius = 10
            alert.layer.backgroundColor = UIColor ( red: 1.0, green: 0.9954, blue: 0.5578, alpha: 1.0 ).CGColor
            
            let scale1 = CGAffineTransformMakeScale(0.01, 0.01)
            alert.transform = scale1
            self.view.addSubview(alert)
            
            alertLabel = UILabel()
            alertLabel.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
            alertLabel.font = UIFont.systemFontOfSize(30)
            alertLabel.text = "Wrong!"
            alertLabel.textColor = UIColor ( red: 0.3029, green: 0.4674, blue: 1.0, alpha: 1.0 )
            alertLabel.textAlignment = .Center
            alertLabel.center.x = alert.bounds.width / 2
            alertLabel.center.y = alert.bounds.height / 2 - 40
            alert.addSubview(alertLabel)
            
            alertButton = UIButton()
            alertButton.bounds = CGRect(x: 0, y: 0, width: 200, height: 50)
            alertButton.backgroundColor = UIColor ( red: 0.644, green: 1.0, blue: 0.4997, alpha: 1.0 )
            alertButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            alertButton.setTitle("OK", forState: .Normal)
            alertButton.center.x = alert.bounds.width / 2
            alertButton.center.y = alert.bounds.height / 2 + 75
            alertButton.layer.cornerRadius = 10
            alertButton.addTarget(self, action: #selector(ViewController.ok(_:)), forControlEvents: .TouchUpInside)
            alert.addSubview(alertButton)
            
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .AllowUserInteraction, animations: {
                    let scale2 = CGAffineTransformMakeScale(1, 1)
                    self.alert.transform = scale2
                }, completion: nil)
        }
        signinDisabled = !signinDisabled
    }
    
    func ok(sender: UIButton) {
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .AllowUserInteraction, animations: {
                let scale = CGAffineTransformMakeScale(0.01, 0.01)
                self.alert.transform = scale
            
                self.shadow.opacity = 0
            }) { (true) in
                self.shadow.removeFromSuperlayer()
                self.alert.removeFromSuperview()
        }
        
        signinDisabled = !signinDisabled
    }
}

