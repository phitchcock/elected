//
//  StaffMember.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/30/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation

class StaffMember {
    var name: String
    var email: String
    var title: String

    init(name: String, email: String, title: String) {
        self.name = name
        self.email = email
        self.title = title
    }
}