//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 09/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var healthStore = HKHealthStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        if !HKHealthStore.isHealthDataAvailable() {
            print("设备不支持healthKit")
        } else {
            HealthManager().authorizeHealthKit() { (success, error) -> Void in
                if success {
                    print("success")
                    self.readStepCount()
                } else {
                    print("error: \(error)")
                }
            }

        }
        label.text = "读取中..."
    }
    
    func readStepCount() {
        let sampleType = HKQuantityType.quantityType(forIdentifier: .stepCount)
        let start = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let end = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        
        let sampleQuery = HKSampleQuery(sampleType: sampleType!, predicate: predicateForSamplesToday(), limit: HKObjectQueryNoLimit, sortDescriptors: [start, end]) { (query, results, error) in

            var stepCount: Double = 0.0
            for result in results! {
                let stepCountUnit = HKUnit.count()
                let quantity = (result as! HKQuantitySample).quantity.doubleValue(for: stepCountUnit)
                stepCount += quantity
            }
            
            print("new step count: \(stepCount)")
            let todayStepCount = Int(stepCount)
            
            OperationQueue.main.addOperation({
                self.label.text = "今天的步数：\(todayStepCount)"
            })
        }
        
        self.healthStore.execute(sampleQuery)
    }
    
    func saveStepCount(stepQuantity: HKQuantity, completion: ((_ success: Bool, _ error: Error?) -> Void)!) {
        let calender = Calendar.current
        let now = Date()
        
        let dateComponents = calender.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day, Calendar.Component.hour, Calendar.Component.minute, Calendar.Component.second], from: now)
        
        
        let startDate = calender.date(from: dateComponents)
        let endDate = calender.date(byAdding: Calendar.Component.minute, value: 1, to: startDate!)
        
        let stepSamples = HKQuantitySample(type: HKQuantityType.quantityType(forIdentifier: .stepCount)!, quantity: stepQuantity, start: startDate!, end: endDate!)
        let workOut = HKWorkout(activityType: .walking, start: startDate!, end: endDate!)
        healthStore.save(workOut, withCompletion: { success, error in
            if success {
                self.healthStore.add([stepSamples], to: workOut) { (success, error) in
                    completion(success, error)
                }
            } else {
                print(error)
            }
        })
        
        
        
        
    }

    func predicateForSamplesToday() -> NSPredicate {
        let calender = Calendar.current
        let now = Date()
        
        var dateComponents = calender.dateComponents([Calendar.Component.year, Calendar.Component.month, Calendar.Component.day], from: now)
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        
        let startDate = calender.date(from: dateComponents)
        let endDate = calender.date(byAdding: Calendar.Component.day, value: 1, to: startDate!)
    
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        return predicate
    }
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        self.readStepCount()
    }
    @IBAction func addButtonTapped(_ sender: AnyObject) {
        let quantity = HKQuantity(unit: HKUnit.count(), doubleValue: 1000.0)
        saveStepCount(stepQuantity: quantity) { success, error in
            if (success) {
                print("add success")
            } else {
                print(error)
            }
            self.readStepCount()
        }
    }

}

