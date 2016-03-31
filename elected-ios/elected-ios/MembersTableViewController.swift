//
//  MembersTableViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Alamofire
import Haneke

class MembersTableViewController: UITableViewController {

    var city: City?
    var officials = [Official]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getLocations()
        if let city = city {
            title = city.name
        }
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
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

    func getLocations() {

        Alamofire.request(.GET, "https://sac-elected.herokuapp.com/api/v1/cities/\(city!.id)")
            .responseJSON { response in

                if let JSON = response.result.value {

                    //print(JSON)
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

                        if let staffJson = a["staff_members"] {
                            print(staffJson)
                        }

                        let official = Official(name: name, image: image, cityId: cityId, bio: bio, street: street, cityCode: cityCode, state: state, zip: zip, phone: phone, email: email, fax: fax, title: title)

                        if fb != nil {
                            official.fb = fb
                        }

                        if let staffJson = a["staff_members"] {

                            var dict = staffJson as! [AnyObject]

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
                                print(staffMembers.count)
                                print(official.staffMembers)
                                staffMembers.append(staffMember)
                            }


                        }

                        self.officials.append(official)
                        
                    }

                    self.tableView.reloadData()
                }
        }
        
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "officialSegue" {

            let dvc = segue.destinationViewController as! ProfileViewController

            if let row = tableView.indexPathForSelectedRow?.row {
                let official = officials[row]
                dvc.official = official
                print(official.staffMembers?.count)
            }
        }
        
    }



}
