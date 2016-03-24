//
//  ProfileViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var contactContainer: UIView!
    @IBOutlet weak var bioContainer: UIView!
    @IBOutlet weak var peopleContainer: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideContainerViewsByIndex()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {

        switch segmentedControl.selectedSegmentIndex {
        case 0:
            hideContainerViewsByIndex()
        case 1:
            hideContainerViewsByIndex()
        case 2:
            hideContainerViewsByIndex()
        default:
            break
        }
    }

    func hideContainerViewsByIndex() {
        if segmentedControl.selectedSegmentIndex == 0 {
            contactContainer.hidden = false
            bioContainer.hidden = true
            peopleContainer.hidden = true
        }
        else if segmentedControl.selectedSegmentIndex == 1 {
            contactContainer.hidden = true
            bioContainer.hidden = false
            peopleContainer.hidden = true
        }
        else if segmentedControl.selectedSegmentIndex == 2 {
            contactContainer.hidden = true
            bioContainer.hidden = true
            peopleContainer.hidden = false
        }
    }

}
