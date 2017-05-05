//
//  Categories.swift
//  HotlineApp
//
//  Created by Alex Yang on 4/13/17.
//  Copyright © 2017 Alex Yang. All rights reserved.
//

import Foundation
//Tag for how to deal with online, offline is based off of "Variable" "None" and "Online" index 3
class Categories {
    static var Medical: [String:[[String]]] =
        [
            "Load": [["National STD Hotline","8002278922","24/7","Online","National"],
                         ["Poison Control Hotline","8002221222","24/7","Online","National"],
                         ["Planned Parenthood Hotline","8002307526","24/7","Online","National"]],
            "Alameda": [["Health,Housing & Human Services","211","24/7","Online","Local"],
                        ["Medi-Cal","18005415555","Mon-Fri:8am-5pm","Variable","State","8","17"]],
            "Santa Barbara": [["Health, Housing & Human Services","211","24/7","Online","Local"],
                        ["Medi-Cal","18005415555","Mon-Fri:8am-5pm","Variable","State","8","17"]]
            ,
            "San Francisco": [["Medi-Cal","1-800-541-5555","Mon-Fri:8am-5pm","Variable","State","8","17"]]
            ]
    static var AnimalRelated: [String:[[String]]] =
        [
            "Load": [["PETA Animal Cruelty","576227382","Hours not listed","None","National"],
                         ["Animal Behavior Hotline","3126448338","Hours not listed","None","National"],
                         ["National Animal Lost & Found","8002527894","24/7","Online","National"]]
            ]
    static var Abuse: [String:[[String]]] =
        [
            "Load": [["National Child Abuse","8004224453","24/7","Online","National"],
                        ["Dating Abuse & Domestic Violence","8663319474","24/7","Online","National"],
                        ["Rape, Abuse, and Incest Hotlines","8006564673","24/7","Online","National"]],
            "Alameda": [["Alameda Child Abuse","5102591800","24/7","Online","Local"],
                        ["Alameda Elder Abuse","5105773500","24/7","Online","Local"],
                        ["Alameda Civil Rights Officer","510-326-1857","Hours not listed","None","Local"]],
            "San Francisco": [["San Francisco Child Abuse","8008565553","24/7","Online","Local"]]

            ]
    static var SelfHelp: [String:[[String]]] =
        [
            "Load": [["Alcohol & Drug Abuse","8007296686","24/7","Online","National"],
                        ["Families Anonymous(Alcohol)","8007369805","24/7","Online","National"],
                        ["National Helpline for Substance Abuse","8002622463","24/7","Online","National"],
                        ["Youth Suicide Prevention","8664887386","24/7","Online","National"],
                        ["National Suicide Prevention Hotline","8002738255","24/7","Online","National"],
                        ["National Runaway Switchboard","8002316946","24/7","Online","National"],
                        ["Disaster Distress Hotline","8009855990","24/7","Online","National"]],
            "San Francisco": [["San Francisco Suicide Prevention","8002738255","24/7","Online","Local"]]
            
    ]
    static var LaborSexTrafficking: [String:[[String]]] =
        [
            "Load": [["Human Trafficking Hotline","8883737888","24/7","Online","National"]],
            ]
    static var Other: [String:[[String]]] =
        [
            "Load": [["WeTip Anonymous Crime Reporting","18007827463","24/7","Online","National"],
                        ["Missing & Exploited Children Hotline","8008435678","24/7","Online","National"],
                        ["ShopLifters Anonymous","8008489595","24/7","Online","National"],
                        ["Victim of Crime Hotline","8554842846","Mon-Fri:9am-7pm","Variable","National","9","19"],
                        ["Company Anonymous Reporting Services","2158846150 ","24/7","Online","National"]],
            ]
    static var categoryDict: [Int:[String:[[String]]]] =
        [
            0: Medical,
            1: AnimalRelated,
            2: Abuse,
            3: SelfHelp,
            4: LaborSexTrafficking,
            5: Other,
        ]
}
