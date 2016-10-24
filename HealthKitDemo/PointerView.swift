//
//  PointerView.swift
//  HealthKitDemo
//
//  Created by qiuhong on 19/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//


import UIKit


@IBDesignable
class PointerView: UIView {
    
    var x: CGFloat?
    var y: CGFloat?
    var radius:CGFloat?
    var color: CGColor?
    var progress:Double?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        x = frame.size.width/2
        y = frame.size.height/2
    }
    
    convenience init(frame: CGRect, radius: CGFloat, progress: Double, color: CGColor){
        self.init(frame: frame)
        self.radius = radius
        self.progress = progress
        self.color = color
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    
    override func draw(_ rect: CGRect) {
        let ctx : CGContext = UIGraphicsGetCurrentContext()!
        ctx.beginPath()
        drawPointer(ctx, radius: radius!, progress: progress!)
    }
    
    func drawPointer(_ context:CGContext, radius:CGFloat, progress: Double){
        let tmp: Double = (progress - 30) * M_PI / 180;
        let movedFirstX: CGFloat = CGFloat(1-cos(tmp)) * radius
        let movedFirstY: CGFloat = CGFloat(sin(tmp)) * radius
        
        let secTmp: Double = sin(2 * M_PI / 180)
        let movedSecX: CGFloat = radius * CGFloat(secTmp) * CGFloat(sin(tmp))
        let movedSecY: CGFloat = radius * CGFloat(secTmp) * CGFloat(cos(tmp))
        // draw right point
        context.move(to: CGPoint(x: (x! + radius - movedFirstX), y: (y! - movedFirstY)));
        context.addLine(to: CGPoint(x: (x! - movedSecX), y: (y! - movedSecY)));
        context.addLine(to: CGPoint(x: (x! + movedSecX), y: (y! + movedSecY)));
        
        context.closePath()
        var rgbColor = color!.components
        context.setFillColor(red: (rgbColor?[0])!, green: (rgbColor?[1])!, blue: (rgbColor?[2])!, alpha: 0.80);
        //CGContextSetStrokeColorWithColor(context, color?.CGColor);
        context.fillPath();
        
        //draw left point
        context.move(to: CGPoint(x: (x! - (radius - movedFirstX) * 0.1), y: (y! + movedFirstY * 0.1)));
        context.addLine(to: CGPoint(x: (x! - movedSecX), y: (y! - movedSecY)));
        context.addLine(to: CGPoint(x: (x! + movedSecX), y: (y! + movedSecY)));
        
        context.closePath()
        //CGContextSetRGBFillColor(context, 1.0, 0.5, 0.0, 0.80);
        context.fillPath();
        
        //draw center circle
//        CGContextAddArc(context, x!, y!, 2, 0, 360, 0);
//        context.setFillColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
//        context.drawPath(using: kCGPathFill);
        
        
        let ovalRect = CGRect(x: 0, y: 0, width: x! * 2, height: y! * 2)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint(x: x!, y: y!), radius:2, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        ovalPath.addLine(to: CGPoint(x: ovalRect.midX, y: ovalRect.midY))
        ovalPath.close()
        
        UIColor.gray.setFill()
        ovalPath.fill()
        
    }
    
    
}

