//
//  MainTableViewController.swift
//  PodsDemo
//
//  Created by  Harold LIU on 3/16/16.
//  Copyright © 2016 Tongji Apple Club. All rights reserved.
//

import UIKit
import LTNavigationBar

class MainTableViewController: UITableViewController {
    
    let NAVBAR_CHANGE_POINT:CGFloat = 50

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.lt_setBackgroundColor(UIColor.clearColor())
        tableView.dataSource = self
        
        
    }
    
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let color = UIColor.lxd_BlueColor()
        let offsetY = scrollView.contentOffset.y
        
        if offsetY > NAVBAR_CHANGE_POINT
        {
            let alpha = min(1, 1-((NAVBAR_CHANGE_POINT+64-offsetY)/64))
            
            navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(alpha))
        }
        else
        {
            navigationController?.navigationBar.lt_setBackgroundColor(color.colorWithAlphaComponent(0))
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        scrollViewDidScroll(tableView)
        tableView.delegate = self
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tableView.delegate = nil
        navigationController?.navigationBar.lt_reset()
    }
//MARK:- Delegate && Datasource 
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        cell.textLabel?.text = "balalala"
        
        return cell
        
    }
    

    
}

