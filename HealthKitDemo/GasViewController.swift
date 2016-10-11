//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 09/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import CoreData

class GasViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var wheelImage: UIImageView!
    
    var wheelRotation: CGFloat = 0.0
    var rotationLimited: CGFloat = 2 * CGFloat(M_PI) * 240 / 360
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0%"
        self.wheelImage.transform = self.wheelImage!.transform.rotated(by: -rotationLimited / 2)
    }
    
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        
        
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject) {
        storePerson(price: Double(wheelRotation / rotationLimited * 100), date: Date(), category: 0)
        print(Date().description)
    }
    
    func imageOperation() {
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
            self.wheelImage.transform = self.wheelImage!.transform.rotated(by: CGFloat(M_PI_2))
            }, completion: { Void in
                self.imageOperation()
        })
        
    }
    

    
    @IBAction func panned(_ sender: AnyObject) {
        
        let panGesture = sender as! UIPanGestureRecognizer
        let velocity = panGesture.velocity(in: wheelImage)
        let rotation = CGFloat(M_PI / 360 / 20) * velocity.x
        if wheelRotation + rotation > 0 && wheelRotation + rotation < rotationLimited  {
            self.wheelImage.transform = self.wheelImage!.transform.rotated(by: rotation)
            self.wheelRotation += rotation
        }
        
        let cg = wheelRotation / rotationLimited * 100
        let int = lroundf(Float(cg))
        label.text = "\(int)%"
        
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func storePerson(price: Double, date: Date, category: Int){
        let context = getContext()
        // 定义一个entity，这个entity一定要在xcdatamodeld中做好定义
        let entity = NSEntityDescription.entity(forEntityName: "Record", in: context)
        
        let record = NSManagedObject(entity: entity!, insertInto: context)
        
        record.setValue(price, forKey: "price")
        record.setValue(date, forKey: "date")
        record.setValue(category, forKey: "category")
        
        do {
            try context.save()
            print("saved")
        }catch{
            print(error)
        }
    }
    
    
    
}

