//
//  Contact.swift
//  DataKit
//
//  Created by Jesus Guerra on 3/29/17.
//  Copyright © 2017 Jesus Guerra. All rights reserved.
//

import Foundation
import RealmSwift

class Contact: Object {
  dynamic var firstName = ""
  dynamic var lastName = ""
  dynamic var phoneNumber = ""
  dynamic var age = 0
  dynamic var address = ""
  dynamic var owner: Group? // to-one relationships must be optional
}
