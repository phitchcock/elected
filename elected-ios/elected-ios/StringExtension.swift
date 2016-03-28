//
//  StringExtension.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/28/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation


extension String {
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }

    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
}
