//
//  UIApplicationExtension.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/30/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.sharedApplication()
        for url in urls {
            if application.canOpenURL(NSURL(string: url)!) {
                application.openURL(NSURL(string: url)!)
                return
            }
        }
    }
}
