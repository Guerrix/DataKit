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
        if id == 0 {
            self.id = Int(NSDate().timeIntervalSince1970) // Generate id from TimeStam
        }
        let realm = try! Realm()
        try! realm.write {
            realm.add(self, update: true)
        }
    }
    
    /// Delete record from database
    public func delete() {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(self)
        }
    }
    
    
    /// Get All Contacts from database
    ///
    /// - Returns: Results<Contact> generic array for with Contact objects
    public static func getAll() -> Results<Contact> {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let realm = try! Realm()
        return realm.objects(Contact.self)
    }
    
    public static func getAllWithoutGroup() -> Results<Contact> {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let realm = try! Realm()
        return realm.objects(Contact.self).filter("group == nil")
    }
    
}
