//
//  IndicatorView.swift
//  HealthKitDemo
//
//  Created by qiuhong on 13/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class IndicatorView: UIView {


    override func draw(_ rect: CGRect) {
        // Drawing code
        
//        let indicatorHeight = rect.height * 85 / 200
//        let indicatorWidth = rect.width * 2 / 200
        
        let bezierHeight = rect.height * 85 / 200
        let bezierWidth = rect.width * 4 / 200
        
        let wheel3Width = 15 / 200 * rect.width
        let wheel4Width = 10 / 200 * rect.width
        
//        //// Rectangle Drawing
//        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: rect.minX + rect.width / 2 - indicatorWidth / 2, y: rect.minY + rect.width / 2 - indicatorHeight, width: indicatorWidth, height: indicatorHeight), cornerRadius: indicatorWidth / 2)
//        UIColor.red.setFill()
//        rectanglePath.fill()
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: rect.minX + rect.width / 2 - bezierWidth / 4, y: rect.minY + rect.height / 2 - bezierHeight))
        bezierPath.addLine(to: CGPoint(x: rect.minX + rect.width / 2 + bezierWidth / 4, y: rect.minY + rect.height / 2 - bezierHeight))
        bezierPath.addLine(to: CGPoint(x: rect.minX + rect.width / 2 + bezierWidth / 2, y: rect.minY + rect.height / 2))
        bezierPath.addLine(to: CGPoint(x: rect.minX + rect.width / 2 - bezierWidth / 2, y: rect.minY + rect.height / 2))
        bezierPath.addLine(to: CGPoint(x: rect.minX + rect.width / 2 - bezierWidth / 4, y: rect.minY + rect.height / 2 - bezierHeight))
        bezierPath.close()
        UIColor.red.setFill()
        bezierPath.fill()

        
        
        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: rect.minX + rect.width / 2 - wheel3Width, y: rect.width / 2 - wheel3Width, width: 2 * wheel3Width, height: 2 * wheel3Width))
        UIColor.white.setFill()
        oval3Path.fill()
        
        
        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: rect.minX + rect.width / 2 - wheel4Width, y: rect.width / 2 - wheel4Width, width: 2 * wheel4Width, height: 2 * wheel4Width))
        UIColor.gray.setFill()
        oval4Path.fill()

    }
 
    
    

}
