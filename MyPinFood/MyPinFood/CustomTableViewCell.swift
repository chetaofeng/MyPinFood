//
//  CustomTableViewCell.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/24.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var resturantImg: UIImageView!
    @IBOutlet weak var resturantName: UILabel!
    @IBOutlet weak var resturantPlace: UILabel!
    @IBOutlet weak var resturantType: UILabel!
    @IBOutlet weak var hasVisitedImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
