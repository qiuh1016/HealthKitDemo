//
//  WheelView.swift
//  HealthKitDemo
//
//  Created by qiuhong on 13/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class WheelView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

    
    override func draw(_ rect: CGRect) {
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        let space = 10 / 200 * rect.width
        
        let bigIndicatorWidth = 3 * rect.width / 200
        let bigIndicatorHeight = 6 * rect.width / 200
        
        let smallIndicatorWidth = 1 * rect.width / 200
        let smallIndicatorHeight = 4 * rect.width / 200
        
//        let wheel3Width = 10 / 200 * rect.width
//        let wheel4Width = 8 / 200 * rect.width
        
        //// Color Declarations
        let color = UIColor(red: 0.833, green: 0.569, blue: 0.569, alpha: 1.000)
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height))
        UIColor.gray.setFill()
        ovalPath.fill()
        
        
        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: rect.minX + space / 2, y: rect.minY + space / 2, width: rect.width - space, height: rect.height - space))
        UIColor.darkGray.setFill()
        oval2Path.fill()
        
        
//        //// Oval 5 Drawing
//        let oval5Rect = CGRect(x: rect.minX + space / 2, y: rect.minY + space / 2, width: rect.width - space, height: rect.width - space)
//        let oval5Path = UIBezierPath()
//        oval5Path.addArc(withCenter: CGPoint(x: oval5Rect.midX, y: oval5Rect.midY), radius: oval5Rect.width / 2, startAngle: 140 * CGFloat(M_PI)/180, endAngle: 40 * CGFloat(M_PI)/180, clockwise: true)
//        oval5Path.addLine(to: CGPoint(x: oval5Rect.midX, y: oval5Rect.midY))
//        oval5Path.close()
//        
//        color.setFill()
//        oval5Path.fill()
//
//        
//        //// Oval 3 Drawing
//        let oval3Path = UIBezierPath(ovalIn: CGRect(x: rect.minX + rect.width / 2 - wheel3Width, y: rect.width / 2 - wheel3Width, width: 2 * wheel3Width, height: 2 * wheel3Width))
//        UIColor.white.setFill()
//        oval3Path.fill()
//        
//        
//        //// Oval 4 Drawing
//        let oval4Path = UIBezierPath(ovalIn: CGRect(x: rect.minX + rect.width / 2 - wheel4Width, y: rect.width / 2 - wheel4Width, width: 2 * wheel4Width, height: 2 * wheel4Width))
//        UIColor.gray.setFill()
//        oval4Path.fill()
        
        //// Rectangle Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 167 * rect.width / 200, y: rect.minY + 158.14 * rect.width / 200)
        context!.rotate(by: -50 * CGFloat(M_PI) / 180)
        
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorWidth, height: bigIndicatorHeight))
        UIColor.white.setFill()
        rectanglePath.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 2 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 27.93 * rect.width / 200, y: rect.minY + 162 * rect.width / 200)
        context!.rotate(by: -130 * CGFloat(M_PI) / 180)
        
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorWidth, height: bigIndicatorHeight))
        UIColor.red.setFill()
        rectangle2Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: rect.minX + 99 * rect.width / 200, y: rect.minY + 5 * rect.width / 200, width: bigIndicatorWidth, height: bigIndicatorHeight))
        UIColor.white.setFill()
        rectangle3Path.fill()
        
        
        //// Rectangle 4 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 13.1 * rect.width / 200, y: rect.minY + 61.46 * rect.width / 200)
        context!.rotate(by: -65 * CGFloat(M_PI) / 180)
        
        let rectangle4Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorWidth, height: bigIndicatorHeight))
        UIColor.white.setFill()
        rectangle4Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 5 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 185.44 * rect.width / 200, y: rect.minY + 58.75 * rect.width / 200)
        context!.rotate(by: 65 * CGFloat(M_PI) / 180)
        
        let rectangle5Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorWidth, height: bigIndicatorHeight))
        UIColor.white.setFill()
        rectangle5Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 6 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 188.39 * rect.width / 200, y: rect.minY + 110.24 * rect.width / 200)
        context!.rotate(by: 7.5 * CGFloat(M_PI) / 180)
        
        let rectangle6Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorHeight, height: bigIndicatorWidth))
        UIColor.white.setFill()
        rectangle6Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 7 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 5.7 * rect.width / 200, y: rect.minY + 111.03 * rect.width / 200)
        context!.rotate(by: -7.5 * CGFloat(M_PI) / 180)
        
        let rectangle7Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorHeight, height: bigIndicatorWidth))
        UIColor.red.setFill()
        rectangle7Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 8 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 50.43 * rect.width / 200, y: rect.minY + 19.23 * rect.width / 200)
        context!.rotate(by: 57.5 * CGFloat(M_PI) / 180)
        
        let rectangle8Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorHeight, height: bigIndicatorWidth))
        UIColor.white.setFill()
        rectangle8Path.fill()
        
        context!.restoreGState()
        
        //// Rectangle 9 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 147 * rect.width / 200, y: rect.minY + 24.39 * rect.width / 200)
        context!.rotate(by: -57.5 * CGFloat(M_PI) / 180)
        
        let rectangle9Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bigIndicatorHeight, height: bigIndicatorWidth))
        UIColor.white.setFill()
        rectangle9Path.fill()
        
        context!.restoreGState()
        
        //// Rectangle 10 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 183.4 * rect.width / 200, y: rect.minY + 136.47 * rect.width / 200)
        context!.rotate(by: 23.75 * CGFloat(M_PI) / 180)
        
        let rectangle10Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.white.setFill()
        rectangle10Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 11 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 189.8 * rect.width / 200, y: rect.minY + 85.5 * rect.width / 200)
        context!.rotate(by: -8.75 * CGFloat(M_PI) / 180)
        
        let rectangle11Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.white.setFill()
        rectangle11Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 12 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 168 * rect.width / 200, y: rect.minY + 39.5 * rect.width / 200)
        context!.rotate(by: -41.25 * CGFloat(M_PI) / 180)
        
        let rectangle12Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.white.setFill()
        rectangle12Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 13 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 125 * rect.width / 200, y: rect.minY + 12.52 * rect.width / 200)
        context!.rotate(by: -73.75 * CGFloat(M_PI) / 180)
        
        let rectangle13Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.white.setFill()
        rectangle13Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 14 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 74.12 * rect.width / 200, y: rect.minY + 12.8 * rect.width / 200)
        context!.rotate(by: -106.25 * CGFloat(M_PI) / 180)
        
        let rectangle14Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.white.setFill()
        rectangle14Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 15 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 31.3 * rect.width / 200, y: rect.minY + 40.5 * rect.width / 200)
        context!.rotate(by: -138.75 * CGFloat(M_PI) / 180)
        
        let rectangle15Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.white.setFill()
        rectangle15Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 16 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 9.95 * rect.width / 200, y: rect.minY + 86.5 * rect.width / 200)
        context!.rotate(by: -171.25 * CGFloat(M_PI) / 180)
        
        let rectangle16Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.white.setFill()
        rectangle16Path.fill()
        
        context!.restoreGState()
        
        
        //// Rectangle 17 Drawing
        context!.saveGState()
        context!.translateBy(x: rect.minX + 17 * rect.width / 200, y: rect.minY + 137.1 * rect.width / 200)
        context!.rotate(by: -203.75 * CGFloat(M_PI) / 180)
        
        let rectangle17Path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: smallIndicatorHeight, height: smallIndicatorWidth))
        UIColor.red.setFill()
        rectangle17Path.fill()
        
        context!.restoreGState()
        
        
        //// Text Drawing
        let textRect = CGRect(x: rect.minX + 84 * rect.width / 200, y: rect.minY + 16 * rect.width / 200, width: 32 * rect.width / 200, height: 21 * rect.width / 200)
        let textTextContent = NSString(string: "1/2")
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        
        let textFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(lroundf(Float(20 * rect.width / 200)))), NSForegroundColorAttributeName: UIColor.white, NSParagraphStyleAttributeName: textStyle]
        
        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        context!.saveGState()
        context!.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context!.restoreGState()
        
        
        //// Text 2 Drawing
        let text2Rect = CGRect(x: rect.minX + 149 * rect.width / 200, y: rect.minY + 139 * rect.width / 200, width: 19 * rect.width / 200, height: 21 * rect.width / 200)
        let text2TextContent = NSString(string: "1")
        let text2Style = NSMutableParagraphStyle()
        text2Style.alignment = .center
        
        let text2FontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(lroundf(Float(20 * rect.width / 200)))), NSForegroundColorAttributeName: UIColor.white, NSParagraphStyleAttributeName: text2Style]
        
        let text2TextHeight: CGFloat = text2TextContent.boundingRect(with: CGSize(width: text2Rect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: text2FontAttributes, context: nil).size.height
        context!.saveGState()
        context!.clip(to: text2Rect)
        text2TextContent.draw(in: CGRect(x: text2Rect.minX, y: text2Rect.minY + (text2Rect.height - text2TextHeight) / 2, width: text2Rect.width, height: text2TextHeight), withAttributes: text2FontAttributes)
        context!.restoreGState()
        
        

    }

}
