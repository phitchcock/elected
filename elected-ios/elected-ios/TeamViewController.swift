//
//  TeamViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/25/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {

    var official: Official?
    var members = [StaffMember]()
    var empty = ["No Members"]

    override func viewDidLoad() {
        super.viewDidLoad()

        if let official = official {
            if let staff = official.staffMembers {
                if staff.count > 0 {
                    members = staff
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension TeamViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if members.count > 0 {
            return members.count
        } else {
            return empty.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if members.count > 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            cell.textLabel?.text = members[indexPath.row].name
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            cell.textLabel?.text = empty[indexPath.row]
            return cell
        }
    }
}