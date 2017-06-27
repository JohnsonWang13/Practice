//
//  GraphView.swift
//  CoreGraphicsDemo
//
//  Created by 王富生 on 2017/1/18.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    var startColor: UIColor = .red
    var endColor: UIColor = .yellow
    
    let graphPoint:[Int] = [2, 4, 1, 6, 7, 5, 1]
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocation: [CGFloat] = [0.0, 1.0]
        
        
        let gradient = CGGradient.init(colorsSpace: colorSpace,
                                       colors: colors as CFArray,
                                       locations: colorLocation)
        
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x: 0, y: self.bounds.height)
        context?.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: CGGradientDrawingOptions(rawValue: 0))
        //---------------------------------------------------
        let width = rect.width
        let height = rect.height
        
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: UIRectCorner.allCorners,
                                cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        
        let margin:CGFloat = 20.0
        let columnXPoint = { (column:Int) -> CGFloat in
            let spacer = (width - margin*2 - 4) /
                CGFloat((self.graphPoint.count - 1))
            var x: CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphPoint.max()
        let columnYPoint = { (graphPoint:Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) /
                CGFloat(maxValue!) * graphHeight
            y = graphHeight + topBorder - y
            return y
        }
        UIColor.white.setFill()
        UIColor.white.setStroke()
        //--------------------------------------------------
        let graphPath = UIBezierPath()
        
        graphPath.move(to: CGPoint(x:columnXPoint(0),
                                   y:columnYPoint(graphPoint[0])))
        
        for i in 1..<graphPoint.count {
            let nextPoint = CGPoint(x:columnXPoint(i),
                                    y:columnYPoint(graphPoint[i]))
            graphPath.addLine(to: nextPoint)
        }
        graphPath.stroke()
        //--------------------------------------------------
        context?.saveGState()
        let clippingPath = graphPath.copy() as! UIBezierPath
        
        clippingPath.addLine(to: CGPoint(
            x: columnXPoint(graphPoint.count - 1),
            y: height))
        clippingPath.addLine(to: CGPoint(
            x: columnXPoint(0),
            y: height))
        
        clippingPath.close()
        //剪裁
        clippingPath.addClip()
        
        let heighestYPoint = columnYPoint(maxValue!)
        
        startPoint = CGPoint(x: margin, y: heighestYPoint)
        endPoint = CGPoint(x: margin, y: self.bounds.height)
        
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
        
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        context?.restoreGState()
        
        for i in 0..<graphPoint.count {
            pointForEach(x: columnXPoint(i), y: columnYPoint(graphPoint[i]))
        }
    }
    
    func pointForEach(x: CGFloat, y: CGFloat) {
        var point = CGPoint(x: x, y: y)
        point.x -= 5.0/2
        point.y -= 5.0/2
        
        let circle = UIBezierPath(ovalIn: CGRect(origin: point, size: CGSize(width: 5.0, height: 5.0)))
        circle.fill()
    }
}























