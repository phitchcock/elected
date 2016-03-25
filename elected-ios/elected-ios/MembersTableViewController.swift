//
//  MembersTableViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Alamofire

class MembersTableViewController: UITableViewController {

    var city: City?
    var officials = [Official]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getLocations()
        if let city = city {
            title = city.name
        }
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
        if officials[indexPath.row].image.isEmpty {
            cell.cellImageView.image = UIImage(named: "logo")
        } else {
            cell.cellImageView.imageFromUrl(officials[indexPath.row].image)
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

                        // TODO: Potential crash if streetnumber != a numerical string need to check
                        var name: String
                        var image: String
                        var cityId: Int

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

                        let official = Official(name: name, image: image, cityId: cityId)

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
            }
        }
        
    }



}
