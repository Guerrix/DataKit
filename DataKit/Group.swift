//
//  Group.swift
//  DataKit
//
//  Created by Jesus Guerra on 3/29/17.
//  Copyright © 2017 Jesus Guerra. All rights reserved.
//

import Foundation
import RealmSwift

public class Group: Object {
    public dynamic var id = 0
    public dynamic var name = ""
    public let contacts = List<Contact>()
    
    override public static func primaryKey() -> String? {
        return "id"
    }
}
