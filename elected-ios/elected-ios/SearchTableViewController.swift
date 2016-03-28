//
//  SearchTableViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/28/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Alamofire

class SearchTableViewController: UITableViewController {

    var officials = [Official]()
    var searchActive = false

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return officials.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        cell.textLabel?.text = officials[indexPath.row].name

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
                        
                        self.officials.append(official)
                        
                    }
                    self.tableView.reloadData()
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
