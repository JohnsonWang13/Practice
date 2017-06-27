//
//  ViewDesign.swift
//  CoreGraphicsDemo
//
//  Created by 王富生 on 2017/1/18.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

let noOfGlasses = 8
let π: CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter:Int = 5 {
        didSet {
            if counter <= noOfGlasses {
            setNeedsDisplay()
            }
        }
    }
    var outLineColor: UIColor = .black

    
    override func draw(_ rect: CGRect) {

        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let green: UIColor = UIColor(red: 99/255, green: 183/255, blue: 157/255, alpha: 1)
        let radius: CGFloat = min(bounds.width, bounds.height)
        let arcWidth: CGFloat = 76
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        
        
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = arcWidth
        green.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(noOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - 2.5,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        outlinePath.addArc(withCenter: center,
                                     radius: bounds.width/2 - arcWidth + 2.5,
                                     startAngle: outlineEndAngle,
                                     endAngle: startAngle,
                                     clockwise: false)
        
//        outlinePath.close()
        outLineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
    }
}
