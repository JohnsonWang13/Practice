//
//  ViewController.swift
//  AnimatedTrainsition
//
//  Created by 王富生 on 2017/3/21.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500
        var angle = CGFloat(M_PI/4)
        angle = 0
        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        testView.layer.transform = transform
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
//        destination.modalPresentationStyle = .fullScreen
//        destination.transitioningDelegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("disappear")
    }

    @IBAction func viewRotate(_ sender: UIButton) {
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500
        var angle = CGFloat(M_PI/4)
        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        testView.layer.transform = transform
        
//        UIView.animate(withDuration: 1, animations: {
//            self.testView.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI),0.0,1.0,0.0)
//        }, completion: { _ in
//            UIView.animate(withDuration: 1, animations: {
//                
//                
//            }, completion: { _ in
//                
//                
//            })
//            
//            
//        })
        
    }
    
    @IBAction func viewRotate2(_ sender: UIButton) {
//        UIView.animate(withDuration: 1, animations: {
//            self.testView.layer.transform = CATransform3DMakeRotation(0,1.0,0.0,0.0)
//        }, completion: nil )
        
//        let nextView = SecViewController()
//        let snapView = nextView.view.snapshotView(afterScreenUpdates: true)
//        testView = snapView
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500
        var angle = CGFloat(0)
        transform = CATransform3DRotate(transform, angle, 0, 1, 0)
        testView.layer.transform = transform
    }
}

//extension ViewController: UIViewControllerTransitioningDelegate {
//    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//        let transition = AnimatedTransition()
//        
//        transition.selectdView = testView
//        transition.viewFarm = testView.frame
//        return transition
//    }
//    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//        let transition = AnimatedTransition()
//        return transition
//    }
//}

