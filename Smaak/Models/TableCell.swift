//
//  TableCell.swift
//  Smaak
//
//  Created by Tarun on 29/09/2019.
//  Copyright © 2019 smaak.com. All rights reserved.
//

import UIKit
/// Table Cell for Restaurants list and details
class TableCell: UITableViewCell {
    
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblStatus: UILabel!
    @IBOutlet var lblSorting: UILabel!
    @IBOutlet var ImgImage: UIImageView!
    @IBOutlet var btnFaverout: UIButton!
    @IBOutlet var viewCell : UIView!
}
