//
//  ProfileViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var official: Official?

    @IBOutlet weak var contactContainer: UIView!
    @IBOutlet weak var bioContainer: UIView!
    @IBOutlet weak var peopleContainer: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var bioButton: UIButton!
    @IBOutlet weak var staffButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        hideContainerViewsByIndex(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let official = official {
            nameLabel.text = official.name
            titleLabel.text = official.title
            imageView.imageFromUrl(official.image)//UIImage(named: (official.image))
        }
    }
    
    @IBAction func indexChanged(sender: UIButton) {

        switch sender.tag {
        case 1:
            hideContainerViewsByIndex(sender.tag)
        case 2:
            hideContainerViewsByIndex(sender.tag)
        case 3:
            hideContainerViewsByIndex(sender.tag)
        default:
            break
        }
    }

    @IBAction func dismissVC(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func hideContainerViewsByIndex(tag: Int) {
        if tag == 1 {
            contactContainer.hidden = false
            bioContainer.hidden = true
            peopleContainer.hidden = true
        }
        else if tag == 2 {
            contactContainer.hidden = true
            bioContainer.hidden = false
            peopleContainer.hidden = true
        }
        else if tag == 3 {
            contactContainer.hidden = true
            bioContainer.hidden = true
            peopleContainer.hidden = false
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "contactSegue" {
            let dvc = segue.destinationViewController as! ContactViewController
            dvc.official = official
        }
        if segue.identifier == "staffSegue" {
            let dvc = segue.destinationViewController as! TeamViewController
            dvc.official = official
        }
        if segue.identifier == "bioSegue" {
            let dvc = segue.destinationViewController as! BioViewController
            dvc.official = official
        }
    }

}
