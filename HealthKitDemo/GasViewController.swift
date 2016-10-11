//
//  ViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 09/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import HealthKit

class GasViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var wheelImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0%"
        self.wheelImage.transform = self.wheelImage!.transform.rotated(by: -rotationLimited / 2)
    }
    
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        
        
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject) {
       
    }
    
    func imageOperation() {
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear, animations: {
            self.wheelImage.transform = self.wheelImage!.transform.rotated(by: CGFloat(M_PI_2))
            }, completion: { Void in
                self.imageOperation()
        })
        
    }
    
    var wheelRotation: CGFloat = 0.0
    var rotationLimited: CGFloat = CGFloat(M_PI) * 240 / 360
    
    @IBAction func panned(_ sender: AnyObject) {
        
        let panGesture = sender as! UIPanGestureRecognizer
        let velocity = panGesture.velocity(in: wheelImage)
        let rotation = CGFloat(M_PI / 360 / 20) * velocity.x
        print(wheelRotation)
        if wheelRotation + rotation < -rotationLimited {
            
        } else if wheelRotation + rotation > rotationLimited {
            
        } else {
            self.wheelImage.transform = self.wheelImage!.transform.rotated(by: rotation)
            self.wheelRotation += rotation
        }
        
        let cg = (wheelRotation + rotationLimited) / (2 * rotationLimited) * 100
        let int = lroundf(Float(cg))
        label.text = "\(int)%"
        
        
    }
    
    
    
}

