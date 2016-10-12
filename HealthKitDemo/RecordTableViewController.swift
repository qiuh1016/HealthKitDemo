//
//  RecordTableViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 11/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import CoreData

class RecordTableViewController: UITableViewController {
    
    var searchResults: [NSManagedObject]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getRecords() -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        do {
            searchResults = try getContext().fetch(fetchRequest) as? [NSManagedObject]
            print("numbers of \(searchResults?.count)")
            return searchResults
        } catch  {
            print(error)
            return nil
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let result = getRecords() {
            return result.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let priceLabel = cell.viewWithTag(1000) as! UILabel
        let dateLabel = cell.viewWithTag(1001) as! UILabel
        let mileageLabel = cell.viewWithTag(1002) as! UILabel
        let gasAddLabel = cell.viewWithTag(1003) as! UILabel
        
        let record = searchResults![searchResults!.count - 1 - indexPath.row]
        
        
        let price = record.value(forKey: "price") as! Double
        priceLabel.text = "\(String(format: "%.0f", price))元"
        
        let date = record.value(forKey: "date") as! Date
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: date)
        dateLabel.text = "\(dateString)"
        
        let mileage = record.value(forKey: "mileage") as! Int
        mileageLabel.text = "\(mileage)km"
        
        let restGas = kTotalGas * (record.value(forKey: "restGas") as! Double)
        let unitPrice = record.value(forKey: "unitPrice") as! Double
        
        let gasAdd = lround(price / unitPrice)
        
        if indexPath.row != searchResults!.count - 1 {
            let lastRecord = searchResults![searchResults!.count - 2 - indexPath.row]
            let lastRestGas = kTotalGas * (lastRecord.value(forKey: "restGas") as! Double)
            let lastPrice = lastRecord.value(forKey: "price") as! Double
            let lastUnitPrice = lastRecord.value(forKey: "unitPrice") as! Double
            let lastGas = lastRestGas + lastPrice / lastUnitPrice
            let lastMileage = lastRecord.value(forKey: "mileage") as! Int
            
            let mileDrived = mileage - lastMileage
            let gasUsed = lastGas - restGas
            
            let averageConsumption = gasUsed / Double(mileDrived) * 100
            
            gasAddLabel.text = "本期油耗：\(String(format: "%.2f", averageConsumption))"
            
        } else {
            gasAddLabel.text = "本期油耗：-"
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
