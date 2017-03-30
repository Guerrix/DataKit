//
//  Contact.swift
//  DataKit
//
//  Created by Jesus Guerra on 3/29/17.
//  Copyright © 2017 Jesus Guerra. All rights reserved.
//

import Foundation
import RealmSwift

public class Contact: Object {
  public dynamic var firstName = ""
  public dynamic var lastName = ""
  public dynamic var phoneNumber = ""
  public dynamic var age = 0
  public dynamic var address = ""
  public dynamic var owner: Group? // to-one relationships must be optional
  
  public var fullName: String {
    return "\(firstName) \(lastName)"
  }

}
