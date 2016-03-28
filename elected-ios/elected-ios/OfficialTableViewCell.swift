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
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.cornerRadius = 5
        cellImageView.layer.borderWidth = 2
        cellImageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        cellImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
