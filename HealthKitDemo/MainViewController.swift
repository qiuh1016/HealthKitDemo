//
//  MainViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 24/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let category = ["fuel", "park", "wash", "repare", "maitain", "insurance", "other"]
    let categoryCN = ["燃油", "停车", "洗车", "维修", "保养", "保险", "其他"]
    let images = ["gas6", "car83", "carwash", "car_mechanic", "car_mechanic","safe24", "car_mechanic"]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = categoryCN[indexPath.row] //category[indexPath.row].uppercased()
        cell?.textLabel?.textColor = UIColor.darkGray
        
//        cell?.imageView?.image = UIImage(named: images[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "recordSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recordSegue" {
            let index = sender as! Int
            let vc = segue.destination as! RecordTableViewController
            vc.index = index
        }
    }

}
