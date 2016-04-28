//
//  ChecklistItem.swift
//  TableView
//
//  Created by 李茂琦 on 4/28/16.
//  Copyright © 2016 Li Maoqi. All rights reserved.
//

import Foundation


class ChecklistItem {
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
}
