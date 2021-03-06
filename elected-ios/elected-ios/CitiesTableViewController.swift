//
//  CitiesTableViewController.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/24/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit
import Alamofire
import Haneke

class CitiesTableViewController: UITableViewController {

    var cities = [City]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.tableFooterView = UIView()
        getLocations()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CityTableViewCell
        cell.nameLabel.text = cities[indexPath.row].name
        if cities[indexPath.row].image.isEmpty {
            cell.cellImageView.image = UIImage(named: "logo")
        } else {
            let URLString = cities[indexPath.row].image
            let URL = NSURL(string:URLString)!
            cell.cellImageView.hnk_setImageFromURL(URL)
        }

        return cell
    }

    func getLocations() {

        Alamofire.request(.GET, "https://sac-elected.herokuapp.com/api/v1/cities")
            .responseJSON { response in

                if let JSON = response.result.value {
                    self.cities.removeAll()

                    let dict = JSON

                    let ar = dict["cities"] as! [AnyObject]

                    for a in ar {

                        // TODO: Potential crash if streetnumber != a numerical string need to check
                        var name: String
                        var id: Int
                        var image: String

                        if let nameJson = a["name"] {
                            name = nameJson as! String
                        } else {
                            name = "ERROR"
                        }

                        if let idJson = a["id"] {
                            id = idJson as! Int
                        } else {
                            id = 0
                        }

                        if let imageJson = a["image"] {
                            image = imageJson as! String
                        } else {
                            image = "ERROR"
                        }


                        let city = City(name: name, id: id, image: image)
                        
                        self.cities.append(city)
                        
                    }
                    self.tableView.reloadData()
                }
        }
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "officialsSegue" {

            let dvc = segue.destinationViewController as! MembersTableViewController

            if let row = tableView.indexPathForSelectedRow?.row {
                let city = cities[row]
                dvc.city = city
            }
        }

    }
}
