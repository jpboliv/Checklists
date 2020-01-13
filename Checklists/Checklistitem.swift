//
//  Checklistitem.swift
//  Checklists
//
//  Created by João Oliveira on 13/01/2020.
//  Copyright © 2020 João Oliveira. All rights reserved.
//

import Foundation
class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
