//
//  ViewController.swift
//  CATransform3D practice
//
//  Created by 王富生 on 2017/4/10.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let rotateView = CATransformLayer()
    let blueLayer = CALayer()
    let redLayer = CALayer()
    var degree:CGFloat = 0
    var angle = CGPoint.init(x: 0, y: 0)
    
    @IBOutlet weak var blueView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subView = UIView.init(frame: blueView.bounds)
        subView.backgroundColor = UIColor.blue
        blueView.addSubview(subView)
        
//        addView()
        
//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.rotate), userInfo: nil, repeats: true)
        
//        viewTransform()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform))
        blueView.addGestureRecognizer(panGesture)
        
    }
    
    func addView() {
        
        let viewFrame = UIScreen.main.bounds
        

        rotateView.frame = CGRect(x: 0, y: viewFrame.maxY / 2 - 50, width: viewFrame.width, height: 100)
        
        blueLayer.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        blueLayer.backgroundColor = UIColor.blue.cgColor
        blueLayer.opacity = 0.6
        blueLayer.borderWidth = 3
        blueLayer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        blueLayer.cornerRadius = 10
        
        var blueLayer3D = CATransform3DIdentity
        blueLayer3D = CATransform3DTranslate(blueLayer3D, 0, 0, -30)
        blueLayer.transform = blueLayer3D
        
        redLayer.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        redLayer.backgroundColor = UIColor.red.cgColor
        redLayer.opacity = 0.6
        redLayer.borderWidth = 3
        redLayer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        redLayer.cornerRadius = 10
        
//        var redLayer3D = CATransform3DIdentity
//        redLayer3D = CATransform3DTranslate(redLayer3D, 0, 0, -10)
//        redLayer.transform = redLayer3D
        
        rotateView.addSublayer(blueLayer)
        rotateView.addSublayer(redLayer)
        self.view.layer.addSublayer(rotateView)
        
    }
    
    func rotate() {
        
        var fromValue = CATransform3DIdentity
        fromValue.m34 = -1 / 500
        fromValue = CATransform3DRotate(fromValue, degree, 0, 1, 0)
        
        degree = degree + 45
        
        var toValue = CATransform3DIdentity
        toValue.m34 = -1 / 500
        toValue = CATransform3DRotate(toValue, degree, 0, 1, 0)
        
        let transformAnimate = CABasicAnimation(keyPath: "transform")
        transformAnimate.duration = 1.0
        transformAnimate.fromValue = fromValue
        transformAnimate.toValue = toValue
        blueView.layer.transform = toValue
        
//        blueView.layer.add(transformAnimate, forKey: "transform3D")
//        blueView.layer.removeAnimation(forKey: "transform3D")

    }
    
    func viewTransform(sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: self.view)
        let angleX = angle.x + (point.x/30)
        let angleY = angle.y - (point.y/30)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        blueView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angleX
            angle.y = angleY
        }
    }
}

