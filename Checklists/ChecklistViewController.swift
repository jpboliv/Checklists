//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by João Oliveira on 10/01/2020.
//  Copyright © 2020 João Oliveira. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items = [ChecklistItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = ChecklistItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.text = "Brush my teeth"
        items.append(item2)
        
        let item3 = ChecklistItem()
        item3.text = "Learn iOS development"
        items.append(item3)
        
        let item4 = ChecklistItem()
        item4.text = "Soccer practice"
        items.append(item4)
        
        let item5 = ChecklistItem()
        item5.text = "Eat ice cream"
        items.append(item5)
        
        let item6 = ChecklistItem()
        item6.text = "Walk the dog"
        items.append(item6)
        
        let item7 = ChecklistItem()
        item7.text = "Brush my teeth"
        items.append(item7)
        
        let item8 = ChecklistItem()
        item8.text = "Learn iOS development"
        items.append(item8)
        
        let item9 = ChecklistItem()
        item9.text = "Soccer practice"
        items.append(item9)
        
        let item10 = ChecklistItem()
        item10.text = "Eat ice cream"
        items.append(item10)
    }
    
    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath, with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        configureCheckmark(for: cell, at: indexPath, with: item)
        configureText(for: cell, with: item)
        return cell
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, at: indexPath, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
