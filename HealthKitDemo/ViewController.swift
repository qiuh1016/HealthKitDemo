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
            // 1. Set the types you want to read from HK Store
            let healthKitTypesToRead = Set(arrayLiteral: HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)!,
                                           HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.bloodType)!,
                                           HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!,
                                           HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
                                           HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
                                           HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
                                           HKObjectType.workoutType())
            
            // 2. Set the types you want to write to HK Store
            let healthKitTypesToWrite = Set(arrayLiteral:
                HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex)!,
                                            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!,
                                            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!,
                                            HKQuantityType.workoutType())
            // 4.  Request HealthKit authorization
            HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) -> Void in
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
    

}

