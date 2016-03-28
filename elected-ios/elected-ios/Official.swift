//
//  Official.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation

class Official {
    var name: String
    var image: String
    var cityId: Int
    var bio: String
    var street: String
    var cityCode: String
    var state: String
    var zip: String
    var phone: String
    var email: String
    var fax: String
    var fb: String?
    var title: String

    init(name: String, image: String, cityId: Int, bio: String, street: String, cityCode: String, state: String, zip: String, phone: String, email: String, fax: String, title: String) {
        self.name = name
        self.image = image
        self.cityId = cityId
        self.bio = bio
        self.street = street
        self.cityCode = cityCode
        self.state = state
        self.zip = zip
        self.phone = phone
        self.email = email
        self.fax = fax
        self.title = title
    }
}