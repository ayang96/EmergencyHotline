//
//  TableCellSubclass.swift
//  HotlineApp
//
//  Created by Alex Yang on 4/23/17.
//  Copyright © 2017 Alex Yang. All rights reserved.
//

import Foundation
import UIKit
class TableCellSubclass: UITableViewCell{
    //var tag: Int
    @IBOutlet weak var National: UILabel!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Status: UILabel!
    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var Call: UIButton!
    var phonenumber: String?
    /*init() {
        tag = 1
    }*/
}

