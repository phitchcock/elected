//
//  ContactViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/25/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController {

    var official: Official?

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        if let official = official {
            streetLabel.text = official.street
            cityLabel.text = "\(official.cityCode) \(official.state) \(official.zip)"
            phoneLabel.text = "Phone: \(official.phone)"
            faxLabel.text = "Fax: \(official.fax)"
            emailLabel.text = "\(official.email)"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func callButtonPressed(sender: UIButton) {
        var newNumber = official?.phone.stringByReplacingOccurrencesOfString("-", withString: "")
        newNumber = newNumber?.stringByReplacingOccurrencesOfString("(", withString: "")
        newNumber = newNumber?.stringByReplacingOccurrencesOfString(")", withString: "")
        newNumber = newNumber?.stringByReplacingOccurrencesOfString(" ", withString: "")
        callNumber(newNumber!)
    }

    @IBAction func emailButtonPressed(sender: UIButton) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }

    @IBAction func facebookButtonPressed(sender: UIButton) {
        UIApplication.tryURL([
            /* "fb://profile/116374146706" */
            (official?.fb)! // Website if app fails
            ])
    }

    private func callNumber(phoneNumber:String) {
        if let phoneCallURL:NSURL = NSURL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.sharedApplication()
            if (application.canOpenURL(phoneCallURL)) {
                application.openURL(phoneCallURL);
            }
        }
    }

    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property

        mailComposerVC.setToRecipients([(official?.email)!])
        mailComposerVC.setSubject("Subject...")
        mailComposerVC.setMessageBody("Issue!", isHTML: false)

        return mailComposerVC
    }

    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
}

extension ContactViewController: MFMailComposeViewControllerDelegate {

    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}

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
