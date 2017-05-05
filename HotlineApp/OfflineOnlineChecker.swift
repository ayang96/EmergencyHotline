//
//  OfflineOnlineChecker.swift
//  HotlineApp
//
//  Created by Alex Yang on 4/29/17.
//  Copyright © 2017 Alex Yang. All rights reserved.
//

import Foundation
//Class that checks if a hotline is online or offline
class OfflineOnlineChecker {
    let weekday: Int?
    let hour: Int?
    init() {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .weekday], from: date)
        weekday = components.weekday
        hour = components.hour
    }
    func check(timein: Int,timeout: Int) -> Bool{
        if (2<=weekday!&&weekday!<=6&&timein<=hour!&&hour!<=timeout){
            return true
        }
        return false
    }
}
