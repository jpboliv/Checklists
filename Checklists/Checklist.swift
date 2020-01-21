//
//  Checklist.swift
//  Checklists
//
//  Created by João Oliveira on 16/01/2020.
//  Copyright © 2020 João Oliveira. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
