//
//  DataModel.swift
//  Checklists
//
//  Created by João Oliveira on 21/01/2020.
//  Copyright © 2020 João Oliveira. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
//        print("\(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))")
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    func registerDefaults() {
        let dictionary = ["CheclistIndex": -1, "FirstTime": true] as [String : Any]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ChecklistIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ChecklistIndex")
            UserDefaults.standard.synchronize()
        }
    }
    
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            let checklist = Checklist(name: "List")
            lists.append(checklist)
            
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: "FirstTime")
            userDefaults.synchronize()
        }
    }
    
    func sortChecklists() {
        lists.sort(by: { list1, list2 in return list1.name.localizedStandardCompare(list2.name) == .orderedAscending })
    }
    
    // MARK:- Data Persistence
    func documentsDirectory() -> URL {
      let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

      return paths[0]
    }

    func dataFilePath() -> URL {
      return documentsDirectory().appendingPathComponent("Checklists.plist")
    }

    func saveChecklists() {
      // create an instance of propertylistencoder which will encode the items array, and all checklistitems in it, into data that can be written onto a file
      let encoder = PropertyListEncoder()
      // sets up a block of code to catch swift errors
      do {
          // the encoder is used to encode the items array. throws a swift error if its unable to encode the data
          let data = try encoder.encode(lists)
          // if the data constant was successfully created then data is written onto the file (it can also throw an error, thus the try)
          try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
      } catch {
          print("Error encoding item array: \(error.localizedDescription)")
      }
    }

    func loadChecklists() {
      let path = dataFilePath()
      if let data = try? Data(contentsOf: path) {
          let decoder = PropertyListDecoder()
          do {
              lists = try decoder.decode([Checklist].self, from: data)
            sortChecklists()
          } catch {
              print("Error decoding item array: \(error.localizedDescription)")
          }
      }
    }
    
    class func nextChecklistItemID() -> Int {
        let userDefaults = UserDefaults.standard
        let itemID = userDefaults.integer(forKey: "ChecklistItemID")
        userDefaults.set(itemID + 1, forKey: "ChecklistItemID")
        userDefaults.synchronize()
        
        return itemID
    }
}
