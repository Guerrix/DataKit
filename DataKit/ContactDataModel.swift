//
//  ContactDataModel.swift
//  DataKit
//
//  Created by Jesus Guerra on 3/29/17.
//  Copyright © 2017 Jesus Guerra. All rights reserved.
//

import Foundation
import RealmSwift

public extension Contact {
  
  /// Persist or update record into database
  public func saveOrUpdate() {
    let realm = try! Realm()
    try! realm.write {
      realm.add(self, update: true)
    }
  }
  
}
