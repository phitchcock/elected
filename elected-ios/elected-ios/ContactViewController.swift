//
//  ContactViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/25/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    var official: Official?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let official = official {
            print(official.name)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func callButtonPressed(sender: UIButton) {
    }

    @IBAction func emailButtonPressed(sender: UIButton) {
    }

    @IBAction func facebookButtonPressed(sender: UIButton) {
    }
}
