//
//  ButtonViewDesign.swift
//  CoreGraphicsDemo
//
//  Created by 王富生 on 2017/1/18.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

@IBDesignable class AddButtonViewDesign: UIButton {

    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
        
        drawVerticalLine(lineWidth: CGFloat(3.0))
        drawHorizontalLine(lineWidth: CGFloat(3.0))
    }
}

@IBDesignable class MinusButtonViewDesign: UIButton {
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setFill()
        path.fill()
        
        drawHorizontalLine(lineWidth: CGFloat(2.0))
    }
}

extension UIButton {
    
    func drawHorizontalLine(lineWidth: CGFloat) {
        
        let LineWidth: CGFloat = lineWidth
        let LineLength: CGFloat = min(bounds.height, bounds.width) * 0.6
        
        let plusPath = UIBezierPath()
        
        plusPath.lineWidth = LineWidth
        
        plusPath.move(to: CGPoint(x: (bounds.width - LineLength) / 2, y: bounds.height / 2))
        
        plusPath.addLine(to: CGPoint(x: (bounds.width + LineLength) / 2, y: bounds.height / 2))
        
        UIColor.white.setStroke()
        
        plusPath.stroke()
    }
    
    func drawVerticalLine(lineWidth: CGFloat) {
        
        let LineWidth: CGFloat = lineWidth
        let LineLength: CGFloat = min(bounds.height, bounds.width) * 0.6
        
        let plusPath = UIBezierPath()
        
        plusPath.lineWidth = LineWidth
        
        plusPath.move(to: CGPoint(x: bounds.width / 2, y: (bounds.height - LineLength) / 2))
        
        plusPath.addLine(to: CGPoint(x: bounds.width / 2, y: (bounds.height + LineLength ) / 2))
        
        UIColor.white.setStroke()
        
        plusPath.stroke()
    }
}
