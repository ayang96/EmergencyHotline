//
//  PhoneNumbersViewController.swift
//  HotlineApp
//
//  Created by Alex Yang on 4/22/17.
//  Copyright © 2017 Alex Yang. All rights reserved.
//

import UIKit

class PhoneNumbersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var Footer: UIView!
    
    var tag: Int?
    @IBOutlet weak var tableView: UITableView!
    var colormaker = ColorCreator()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = Footer
        //self.tableView.tableFooterView?.color
        //tableView.backgroundColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
     //   tableView.alwaysBounceVertical = false
        navigationController?.navigationBar.isHidden = false
        //NotificationCenter.default.post(name: NSNotification.Name(rawValue:"test"), object: nil)
        let nc = NotificationCenter.default // Note that default is now a property, not a method call
        nc.addObserver(forName:Notification.Name(rawValue:"test"),
                       object:nil, queue:nil) {
                        notification in
                        print("notification please")
                        self.tableView.reloadData()
        }    }

    func updateUI(notification: NSNotification) {
        print("notification recieved")
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor =  colormaker.UIColorFromHex(hex: 0xEB5757)
        self.navigationController?.navigationBar.tintColor =  colormaker.UIColorFromHex(hex: 0xFDE6E8)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:colormaker.UIColorFromHex(hex: 0xFDE6E8)]
         //self.navigationController?.navigationItem.backBarButtonItem?.title = "WHAT"
       
        switch tag! {
        case 0:
            self.title = "Medical Hotlines"
        case 1:
            self.title = "Animal Hotlines"
        case 2:
            self.title = "Abuse Hotlines"
        case 3:
            self.title = "Self Support Hotlines"
        case 4:
            self.title = "Labor/Sex Trafficking Hotlines"
        case 5:
            self.title = "Other Hotlines"
        default: break
            
        }
        //navigationController?.navigationBar.title
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var test = Categories.categoryDict[tag!]! as [String: [[String]]]
        
        return test["Load"]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "phoneCell") as! TableCellSubclass
        let array =  (Categories.categoryDict[tag!]?["Load"])!
        cell.Name.text = array[indexPath.item][0]
        if(array[indexPath.item][3] == "Online") {
            cell.Hours.text = "Hours: "+array[indexPath.item][2]
            cell.Status.text = array[indexPath.item][3]
        } else if(array[indexPath.item][3] == "None") {
            cell.Status.text = "Hours not listed"
            cell.Status.textColor = colormaker.UIColorFromHex(hex: 0xF2994A)
            cell.Hours.text = ""
        } else if (array[indexPath.item][3] == "Variable"){
            let timechecker = OfflineOnlineChecker()
            cell.Hours.text =  "Hours: "+array[indexPath.item][2]
            if(timechecker.check(timein: Int(array[indexPath.item][5])!,timeout: Int(array[indexPath.item][6])!)){
                cell.Status.text = "Online"
            } else {
                cell.Status.text = "Offline"
                cell.Status.textColor = colormaker.UIColorFromHex(hex: 0xEB5757)
                
            }
        }
        cell.Call.setTitle(array[indexPath.item][1], for: .normal)
        
        cell.National.text = array[indexPath.item][4]
        
        return cell
    }
    @IBAction func Call911(_ sender: Any) {
        guard let number = URL(string: "telprompt://" + "911") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    @IBAction func Call(_ sender: UIButton) {
        print(sender.currentTitle!)
        //sender.setBackgroundImage(, for: .normal)
        guard let number = URL(string: "telprompt://" + sender.currentTitle!) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
