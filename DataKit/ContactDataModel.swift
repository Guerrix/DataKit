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

        try! RealmManager.realm.write {
            RealmManager.realm.add(self, update: true)
        }
    }

    /// Delete record from database
    public func delete() {
        try! RealmManager.realm.write {
            RealmManager.realm.delete(self)
        }
    }


    /// Removes Contct form it's current group
    public func removeFromCurrentGroup() {
        if self.group != nil {
            try! RealmManager.realm.write {
                if let contactIndex = self.group?.contacts.index(of: self) {
                    self.group?.contacts.remove(objectAtIndex: contactIndex)
                }
                self.group = nil
            }
        }
    }

    /// Get All Contacts from database from a given group.
    /// If group parameter is nil it will return all cotacts
    ///
    /// - Parameter group: Group Class
    /// - Returns: Results<Contact> generic array for with Contact objects
    public static func getAll(byGroup group: Group? = nil) -> Results<Contact> {
        if group != nil {
            return RealmManager.realm.objects(Contact.self).filter("group.id == \(group!.id)")
        }
        return RealmManager.realm.objects(Contact.self)
    }

    /// Get All Contacts from database without group
    ///
    /// - Returns: Results<Contact> generic array for with Contact objects
    public static func getAllWithoutGroup() -> Results<Contact> {
        return RealmManager.realm.objects(Contact.self).filter("group == nil")
    }

}
