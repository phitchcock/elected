//
//  City.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation

class City {
    var name: String
    var id: Int
    var officials: [Official]?

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}