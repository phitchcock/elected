//
//  OfficialTableViewCell.swift
//  elected-ios
//
//  Created by Peter Hitchcock on 3/25/16.
//  Copyright © 2016 Peter Hitchcock. All rights reserved.
//

import UIKit

class OfficialTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.cornerRadius = 5
        cellImageView.layer.borderWidth = 1
        cellImageView.layer.borderColor = UIColor(red: 13/255, green: 50/255, blue: 80/255, alpha: 1.0).CGColor
        cellImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
