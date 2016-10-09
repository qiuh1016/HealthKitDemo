//
//  HealthManager.swift
//  HealthKitDemo
//
//  Created by qiuhong on 09/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager {
    
//    func authorizeHealthKit(completion: ((_ success: Bool, _ error: NSError?) -> Void)!) {
//        
//        // 1. Set the types you want to read from HK Store
//        let healthKitTypesToRead = Set(arrayLiteral: HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)!,
//                                       HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.bloodType)!,
//                                       HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!,
//                                       HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
//                                       HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
//                                       HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
//                                       HKObjectType.workoutType())
//        
//        // 2. Set the types you want to write to HK Store
//        let healthKitTypesToWrite = Set(arrayLiteral:
//            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMassIndex)!,
//            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!,
//            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!,
//            HKQuantityType.workoutType())
//        // 3. If the store is not available (for instance, iPad) return an error and don't go on.
//        if !HKHealthStore.isHealthDataAvailable()
//        {
//            let error = NSError(domain: "com.raywenderlich.tutorials.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
//            if( completion != nil )
//            {
//                completion(false, error)
//            }  
//            return;  
//        }    
//        // 4.  Request HealthKit authorization  
//        HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) -> Void in
//            if( completion != nil )  
//            {  
//                completion(success, error)
//            }  
//        }
//    
//    }
    
}
