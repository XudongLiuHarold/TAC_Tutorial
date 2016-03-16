//
//  LeftMenuViewController.swift
//  PodsDemo
//
//  Created by  Harold LIU on 3/16/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit
import RESideMenu

class LeftMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,RESideMenuDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        
        let tableView = UITableView(frame: CGRect(x: 0, y: (view.frame.size.height - 54*5)/2.0, width: view.frame.size.width, height: 54*5), style: UITableViewStyle.Plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.opaque = false
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = nil
        tableView.separatorStyle = .None
        tableView.bounces = false
        tableView.scrollsToTop = false
        
        view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row
        {
        case 0:
            sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (storyboard?.instantiateViewControllerWithIdentifier("firstViewController"))!), animated: true)
            sideMenuViewController.hideMenuViewController()
            break;
        case 1:
            sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (storyboard?.instantiateViewControllerWithIdentifier("secondViewController"))!), animated: true)
            sideMenuViewController.hideMenuViewController()
            break;
        default:
            break;
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("LeftCell")
        
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "LeftCell")
            cell?.backgroundColor = UIColor.clearColor()
            cell?.textLabel?.textColor = UIColor.whiteColor()
            cell?.textLabel?.highlightedTextColor = UIColor.grayColor()
            cell?.selectedBackgroundView = UIView()
        }
        
        let titles = ["Home", "Calendar", "Profile", "Settings", "Log Out"]
        let images = ["IconHome", "IconCalendar", "IconProfile", "IconSettings", "IconEmpty"]
        
        
        cell?.textLabel?.text = titles[indexPath.row]
        cell?.imageView?.image = UIImage(named: images[indexPath.row])
        
        
        return cell!
    }
    
    
}
