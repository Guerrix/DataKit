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
        
        try! RealmManager.realm.write {
            for contact in self.contacts {
                contact.group = self
            }
            RealmManager.realm.add(self, update: true)
        }
    }
    
    /// Delete record from database
    public func delete() {
        try! RealmManager.realm.write {
            RealmManager.realm.delete(self)
        }
    }
    
    
    /// Get All Groups from database
    ///
    /// - Returns: Results<Group> generic array for with Group objects
    public static func getAll() -> Results<Group> {
        return RealmManager.realm.objects(Group.self)
    }
    
}
