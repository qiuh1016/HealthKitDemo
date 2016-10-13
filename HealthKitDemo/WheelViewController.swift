//
//  WheelViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 13/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class WheelViewController: UIViewController {
    
    var isRotate = false

    @IBOutlet weak var indicatorView: IndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.transform = indicatorView.transform.rotated(by: -CGFloat(M_PI) * 130 / 180)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func indicatorRotate() {
        UIView.animate(withDuration: 2 , delay: 0, options: .curveLinear, animations: {
            self.indicatorView.transform = self.indicatorView.transform.rotated(by: CGFloat(M_PI_2))
            }, completion: { Void in
                if self.isRotate {
                    self.indicatorRotate()
                }
        })
    }
    
    @IBAction func rotateButtonTapped(_ sender: AnyObject) {
        if isRotate {
            self.indicatorView.layer.removeAllAnimations()
        } else {
            indicatorRotate()
        }
        isRotate = !isRotate
        
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
