//
//  ViewController.swift
//  TableView
//
//  Created by 李茂琦 on 4/28/16.
//  Copyright © 2016 Li Maoqi. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items = [ChecklistItem]()
    
    required init?(coder aDecoder: NSCoder) {
        
        let row0Item = ChecklistItem()
        row0Item.text = "limaoqi"
        items.append(row0Item)
        
        let row1Item = ChecklistItem()
        row1Item.text = "huangrui"
        items.append(row1Item)
        
        let row2Item = ChecklistItem()
        row2Item.text = "linjunqi"
        items.append(row2Item)
        
        let row3Item = ChecklistItem()
        row3Item.text = "anzhehong"
        items.append(row3Item)
        
        let row4Item = ChecklistItem()
        row4Item.text = "huoteng"
        items.append(row4Item)
        
        super.init(coder: aDecoder)
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        let item = items[indexPath.row]
        
        configureTextForCell(cell, withChecklistItem: item)
        configureCheckmarkForCell(cell, withChecklistItem: item)
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
            let item = items[indexPath.row]
            
            item.toggleChecked()
            configureCheckmarkForCell(cell, withChecklistItem: item)
        }
        
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    @IBAction func addItem(sender: UIBarButtonItem) {
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "I am a new item"
        item.checked = false
        items.append(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    
}