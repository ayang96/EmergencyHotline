//
//  ColorCreator.swift
//  HotlineApp
//
//  Created by Alex Yang on 4/27/17.
//  Copyright © 2017 Alex Yang. All rights reserved.
//

import Foundation
import UIKit
class ColorCreator{
    
    init() {
    }
    
    //A quick function to convert hexcode into UIColors
    func UIColorFromHex(hex: Int) -> UIColor {
        //let x = Float((hex & 0xFF0000) >> 16)
        
    
       return UIColor(red: CGFloat((hex & 0xFF0000) >> 16)/CGFloat(255), green: CGFloat((hex & 0x00FF00) >> 8)/CGFloat(255), blue: CGFloat((hex & 0x0000FF) >> 0)/CGFloat(255), alpha: 1.0)
    }
}
