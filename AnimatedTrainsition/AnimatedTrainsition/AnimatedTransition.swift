//
//  AnimatedTrainsition.swift
//  AnimatedTrainsition
//
//  Created by 王富生 on 2017/3/21.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

class AnimatedTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var selectdView = UIView()
    var viewFarm = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.5
    }
    
    //    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    //        let fromVC = transitionContext.viewController(forKey: .from)
    //        let fromView = fromVC?.view
    //
    //        let toVC = transitionContext.viewController(forKey: .to)
    //        let toView = toVC?.view
    //
    //        toView?.frame = selectdView.frame
    //        toView?.clipsToBounds = true
    //
    //        let containerView = transitionContext.containerView
    //
    //        containerView.addSubview(fromView!)
    //        containerView.addSubview(toView!)
    //
    //
    //        UIView.animate(withDuration: 0.5, animations: {
    //
    //            toView?.frame = UIScreen.main.bounds
    //
    //        }, completion: { _ in
    //
    //            fromView?.removeFromSuperview()
    //            transitionContext.completeTransition(true)
    //
    //        })
    //    }
}


extension AnimatedTransition {
    
    //    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    //        let fromVC = transitionContext.viewController(forKey: .from)
    //        let fromView = fromVC?.view
    //
    //        let toVC = transitionContext.viewController(forKey: .to)
    //        let toView = toVC?.view
    //
    //        let containerView = transitionContext.containerView
    //
    //        containerView.addSubview(fromView!)
    //        containerView.addSubview(toView!)
    //
    //        toView?.alpha = 0
    //
    //        UIView.animate(withDuration: 0.5, animations: {
    //
    //            fromView?.alpha = 0
    //            toView?.frame = UIScreen.main.bounds
    //
    //        }, completion: { _ in
    //            UIView.animate(withDuration: 0.5, animations: {
    //
    //                toView?.alpha = 1
    //
    //            }, completion: { _ in
    //
    //                transitionContext.completeTransition(true)
    //            })
    //
    //        })
    //    }
}

extension AnimatedTransition {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from)
        let fromView = fromVC?.view
        
        let toVC = transitionContext.viewController(forKey: .to)
        let toView = toVC?.view
        toView?.isHidden = true
        
        let snapShot = toVC?.view.snapshotView(afterScreenUpdates: true)
        snapShot?.frame = selectdView.frame
        snapShot?.layer.masksToBounds = true
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toView!)
        containerView.addSubview(snapShot!)
        
        AnimationHelper.perspectiveTransformForContainerView(containerView)
        snapShot?.layer.transform = AnimationHelper.yRotation(M_PI_2)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/3, animations: {
                fromView?.layer.transform =  AnimationHelper.yRotation(-M_PI_2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                snapShot?.layer.transform = AnimationHelper.yRotation(0.0)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                snapShot?.frame = (toView?.frame)!
            })
        }, completion: { _ in
            
            toVC?.view.isHidden = false
            fromVC?.view.layer.transform = AnimationHelper.yRotation(0.0)
            snapShot?.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
