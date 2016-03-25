//
//  LandingViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    @IBOutlet weak var electedButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        electedButton.layer.cornerRadius = 5
        electedButton.layer.borderWidth = 1
        electedButton.layer.borderColor = UIColor.whiteColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
