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
        
        //Setup location services
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        navigationController?.navigationBar.isHidden = true
        
        //An observer to update location when the update button is pressed
        let nc = NotificationCenter.default
        nc.addObserver(forName:Notification.Name(rawValue:"update"),
                       object:nil, queue:nil) {
                        notification in
                        print("updating")
                    self.manager.startUpdatingLocation()
                        
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Make sure that when going back to this view, the navbar is hidden
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location not found")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"test"), object: nil)
        /*for (tag,_) in Categories.categoryDict{
            Categories.categoryDict[tag]!["Load"]! = Categories.categoryDict[tag]!["National"]!

        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"test"), object: nil)*/
    }
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
            let location = locations[0]
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                print("working")
                if let placeMark = placemarks?[0]{
                    let county = placeMark.subAdministrativeArea
                    for (tag,subdict) in Categories.categoryDict{
                        for (location,numbers)in subdict {
                            if (location == county) {
                                Categories.categoryDict[tag]!["Load"]! = numbers +  Categories.categoryDict[tag]!["National"]!
                            }
                        }
                    }
                } else {
                    print("location error")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue:"test"), object: nil)
                    /*for (tag,_) in Categories.categoryDict{
                        Categories.categoryDict[tag]!["Load"]! = Categories.categoryDict[tag]!["National"]!
                        
                    }*/
                }
                
                    //print(Categories.categoryDict[0]?["Load"])
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue:"test"), object: nil)
            })

    }
    
    //If a button other than the 911 button is pressed, then segue to the list of phone numbers
    @IBAction func CategoryPressed(_ sender: UIButton) {
        tag = sender.tag
        performSegue(withIdentifier: "CategoriesToPhone", sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var Call911: UIButton!
    
    //if 911 button is pressed, call 911
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

