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
        loadChecklists()
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
          } catch {
              print("Error decoding item array: \(error.localizedDescription)")
          }
      }
    }
}