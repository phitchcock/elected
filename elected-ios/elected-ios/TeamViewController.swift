//
//  TeamViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/25/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import MessageUI

class TeamViewController: UIViewController {

    var official: Official?
    var members = [StaffMember]()
    var empty = ["No staff members at this time"]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()

        if let official = official {
            if let staff = official.staffMembers {
                if staff.isEmpty {

                }
                else {
                    members = staff
                    print(official.staffMembers!.count)

                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func configuredMailComposeViewController(staff: String) -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property

        mailComposerVC.setToRecipients([(staff)])
        mailComposerVC.setSubject("Subject...")
        mailComposerVC.setMessageBody("Issue!", isHTML: false)

        return mailComposerVC
    }

    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
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
            cell.detailTextLabel?.text = members[indexPath.row].title
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
            cell.textLabel?.text = empty[indexPath.row]
            cell.detailTextLabel?.text = ""
            return cell
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let mailComposeViewController = configuredMailComposeViewController(members[indexPath.row].email)
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
}

extension TeamViewController: MFMailComposeViewControllerDelegate {

    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
