//
//  SearchTableViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/28/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Alamofire
import Haneke
import DZNEmptyDataSet

class SearchTableViewController: UITableViewController {

    var officials = [Official]()
    var searchActive = false

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()

        searchBar.setShowsCancelButton(true, animated: true)
        for ob: UIView in ((searchBar.subviews[0] )).subviews {

            if let z = ob as? UIButton {
                let btn: UIButton = z
                btn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Disabled)
                btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return officials.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! OfficialTableViewCell
        cell.nameLabel.text = officials[indexPath.row].name
        cell.titleLabel.text = officials[indexPath.row].title
        if officials[indexPath.row].image.isEmpty {
            cell.cellImageView.image = UIImage(named: "logo")
        } else {
            let URLString = officials[indexPath.row].image
            let URL = NSURL(string:URLString)!
            cell.cellImageView.hnk_setImageFromURL(URL)
        }
        return cell
    }

    func searchForOfficials(search: String) {

        Alamofire.request(.GET, "https://sac-elected.herokuapp.com/api/v1/officials?utf8=%E2%9C%93&filterrific%5Bsearch_query%5D=\(search)")
            .responseJSON { response in

                if let JSON = response.result.value {

                    self.officials.removeAll()

                    let dict = JSON

                    let ar = dict["officials"] as! [AnyObject]

                    for a in ar {

                        var name: String
                        var image: String
                        var cityId: Int
                        var bio: String
                        var street: String
                        var cityCode: String
                        var state: String
                        var zip: String
                        var phone: String
                        var email: String
                        var fb: String?
                        var fax: String
                        var title: String
                        var staffMembers = [StaffMember]()

                        if let nameJson = a["name"] {
                            name = nameJson as! String
                        } else {
                            name = "ERROR"
                        }

                        if let imageJson = a["image"] {
                            image = imageJson as! String
                        } else {
                            image = "ERROR"
                        }

                        if let idJson = a["id"] {
                            cityId = idJson as! Int
                        } else {
                            cityId = 0
                        }

                        if let bioJson = a["bio"] {
                            bio = bioJson as! String
                        } else {
                            bio = "ERROR"
                        }

                        if let streetJson = a["street"] {
                            street = streetJson as! String
                        } else {
                            street = "ERROR"
                        }

                        if let cityJson = a["city_code"] {
                            cityCode = cityJson as! String
                        } else {
                            cityCode = "ERROR"
                        }

                        if let stateJson = a["state"] {
                            state = stateJson as! String
                        } else {
                            state = "ERROR"
                        }

                        if let zipJson = a["zip"] {
                            zip = zipJson as! String
                        } else {
                            zip = "ERROR"
                        }

                        if let phoneJson = a["phone"] {
                            phone = phoneJson as! String
                        } else {
                            phone = "ERROR"
                        }

                        if let emailJson = a["email"] {
                            email = emailJson as! String
                        } else {
                            email = "ERROR"
                        }

                        if let faxJson = a["fax"] {
                            fax = faxJson as! String
                        } else {
                            fax = "ERROR"
                        }

                        if let fbJson = a["facebook"] {
                            fb = fbJson as? String
                        } else {
                            fb = nil
                        }

                        if let titleJson = a["title"] {
                            title = titleJson as! String
                        } else {
                            title = "ERROR"
                        }

                        let official = Official(name: name, image: image, cityId: cityId, bio: bio, street: street, cityCode: cityCode, state: state, zip: zip, phone: phone, email: email, fax: fax, title: title)
                        
                        if fb != nil {
                            official.fb = fb
                        }


                        if let staffJson = a["staff_members"] {

                            let dict = staffJson as! [AnyObject]

                            staffMembers.removeAll()

                            for o in dict {
                                var name1 = String()
                                var email1 = String()
                                var title1 = String()

                                if let nameJ = o["name"] {
                                    name1 = nameJ as! String
                                }

                                if let emailJ = o["email"] {
                                    email1 = emailJ as! String
                                }

                                if let titleJ = o["title"] {
                                    title1 = titleJ as! String
                                }

                                let staffMember = StaffMember(name: name1, email: email1, title: title1)

                                official.staffMembers = staffMembers

                                staffMembers.append(staffMember)
                            }
                        }
                        
                        self.officials.append(official)
                        
                    }
                    self.tableView.reloadData()
                }
        }
        
    }

    //officialSegueFromSearch
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "officialSegueFromSearch" {

            let dvc = segue.destinationViewController as! ProfileViewController

            if let row = tableView.indexPathForSelectedRow?.row {
                let official = officials[row]
                dvc.official = official
            }
        }
    }

}

extension SearchTableViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
        searchBar.resignFirstResponder()
        searchBar.placeholder = "Search"
        searchBar.text = ""
        officials.removeAll()
        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
        searchBar.resignFirstResponder()
    }

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {

        searchForOfficials(searchText.removeWhitespace())

        if officials.count == 0 {
            searchActive = false
        } else {
            searchActive = true
        }
        self.tableView.reloadData()
    }
}

extension SearchTableViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "Search")
    }

    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Search Officials"
        return NSAttributedString(string: text)
    }

    func imageAnimationForEmptyDataSet(scrollView: UIScrollView!) -> CAAnimation! {
        let animation = CABasicAnimation(keyPath: "transform")
        animation.fromValue = NSValue(CATransform3D: CATransform3DIdentity)
        animation.toValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2), 0.0, 0.0, 1.0))

        animation.duration = 0.25
        animation.cumulative = true
        animation.repeatCount = 1

        return animation
    }

    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "Search for local elected officials within Sacramento County and the seven incorporated cities located in the county."
        return NSAttributedString(string: text)
    }

    /*
    func backgroundColorForEmptyDataSet(scrollView: UIScrollView!) -> UIColor! {
        return UIColor(red: 19/255, green: 36/255, blue: 58/255, alpha: 1.0)
    }
    */
}
