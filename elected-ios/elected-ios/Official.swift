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

    init(name: String, image: String, cityId: Int) {
        self.name = name
        self.image = image
        self.cityId = cityId
    }
}