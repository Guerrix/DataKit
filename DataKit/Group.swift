//
//  Group.swift
//  DataKit
//
//  Created by Jesus Guerra on 3/29/17.
//  Copyright © 2017 Jesus Guerra. All rights reserved.
//

import Foundation
import RealmSwift

class Group: Object {
  dynamic var name = ""
  let contacts = List<Contact>()

}
