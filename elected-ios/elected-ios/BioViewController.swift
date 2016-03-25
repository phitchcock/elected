//
//  BioViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/25/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class BioViewController: UIViewController {

    var official: Official?

    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let official = official {
            textView.text = official.bio
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
