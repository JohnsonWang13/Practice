//
//  ViewController.swift
//  AffineTransform
//
//  Created by 王富生 on 2017/3/20.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    
    @IBOutlet weak var butn: btn!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func gggg(_ sender: Any) {
        print("1")
    }
}

struct ViewTransform {
    static func view3D(view: UIView, z: Double) {
        
        var transform = CATransform3DIdentity
        let angle = CGFloat(-30.0 / 180.0 * M_PI)
        let position = CGFloat(z)
        
        transform.m34 = -1.0/500.0
        transform = CATransform3DTranslate(transform, -10, 0, position)
        view.layer.transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        
    }
}

class btn: UIButton {
    
    var path: UIBezierPath!
    
    override func awakeFromNib() {
        backgroundColor = UIColor.green
//        addTarget(self, action: #selector(touchDown), for: .touchDown)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel?.backgroundColor = UIColor.black
//        let trans = CGAffineTransform(rotationAngle: CGFloat((20 / 180) * Double.pi))
        var transform = CATransform3DRotate(CATransform3DIdentity, CGFloat((80 / 180) * Double.pi), 0, 0, 1)
//        transform.m34 = -1.0/500.0
    
        self.titleLabel?.layer.transform = transform
    }
    
//    override func draw(_ rect: CGRect) {
//        
//        path = UIBezierPath()
//        
//        path.move(to: CGPoint(x: 150, y: 10))
//        path.addLine(to: CGPoint(x: 200,y: 10))
//        path.addLine(to: CGPoint(x: 150, y:100))
//        path.addLine(to: CGPoint(x:100, y:100))
//        path.close()
//        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.fillColor = UIColor.blue.cgColor
//        shapeLayer.path = path.cgPath
//        layer.addSublayer(shapeLayer)
//        
//    }
    
//    func touchDown(button: btn, event: UIEvent) {
//        if let touch = event.touches(for: button)?.first {
//            let location = touch.location(in: button)
//            
//            if path.contains(location) == false {
//                button.cancelTracking(with: nil)
//            }
//        }
//    }
}

