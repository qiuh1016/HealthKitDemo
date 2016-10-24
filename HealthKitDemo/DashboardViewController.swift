//
//  DashboardViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 19/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initPointView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initPointView() {
        let pointView = PointerView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), radius: 50, progress: 20, color: UIColor.red.cgColor)
        self.view.addSubview(pointView)
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
