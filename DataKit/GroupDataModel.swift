//
//  GroupDataModel.swift
//  DataKit
//
//  Created by Jesus Guerra on 3/30/17.
//  Copyright © 2017 Jesus Guerra. All rights reserved.
//

import Foundation
import RealmSwift

public extension Group {
    
    /// Persist or update record into database
    public func saveOrUpdate() {
        if id == 0 {
            self.id = Int(NSDate().timeIntervalSince1970) // Generate id from TimeStam
        }
        
        let realm = try! Realm()
        try! realm.write {
            for contact in self.contacts {
                contact.group = self
            }
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
    
    
    /// Get All Groups from database
    ///
    /// - Returns: Results<Group> generic array for with Group objects
    public static func getAll() -> Results<Group> {
        let realm = try! Realm()
        return realm.objects(Group.self)
    }
    
}
