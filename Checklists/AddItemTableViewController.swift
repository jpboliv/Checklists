//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by João Oliveira on 13/01/2020.
//  Copyright © 2020 João Oliveira. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK:- Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

}
