//
//  CategoriesViewController.swift
//  HotlineApp
//
//  Created by Alex Yang on 4/22/17.
//  Copyright © 2017 Alex Yang. All rights reserved.
//

import UIKit
import CoreLocation
class CategoriesViewController: UIViewController, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var Medical: UIButton!
    var tag: Int?
    var updatedlocations = 0
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        Medical.layer.cornerRadius = 100
        //Medical.layer.maskToBounds=true
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        navigationController?.navigationBar.isHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        if(updatedlocations == 0) {
            let location = locations[0]
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in

                print("COUNTY")
                var flag = 0
                if let placeMark = placemarks?[0]{
                    let county = placeMark.subAdministrativeArea
                    for (tag,subdict) in Categories.categoryDict{
                        for (location,numbers)in subdict {
                            if (location == county) {
                                flag = 1
                                Categories.categoryDict[tag]!["Load"]! = numbers +  Categories.categoryDict[tag]!["Load"]!
                            }
                        }
                    }
                } else {
                    print("location error")
                }
                
                if (flag == 1) {
                    //print(Categories.categoryDict[0]?["Load"])
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue:"test"), object: nil)
                    print("flag is 1")
                }
            })
        }
        updatedlocations = 1

    }
    
    
    @IBAction func CategoryPressed(_ sender: UIButton) {
        tag = sender.tag
        performSegue(withIdentifier: "CategoriesToPhone", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// Send any data to other MVC's before this MVC disappears
    ///
    /// - Parameters:
    ///   - segue: the segue between this MVC and the MVC we are about to go to
    ///   - sender: the button/table view/ etc. that instigated this segue
    ///             In this app, it is either the "View Photo" or "View Name" button
    @IBOutlet weak var Call911: UIButton!
    
    @IBAction func ButtonPressed(_ sender: Any) {
        guard let number = URL(string: "telprompt://" + "911") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategoriesToPhone" {
            if let destinationVC = segue.destination as? PhoneNumbersViewController {
                if let tag = (sender as? CategoriesViewController)?.tag {
                    print(tag)
                    destinationVC.tag = tag
                }
            }
 
        }
    }
}

