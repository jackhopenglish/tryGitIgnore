//
//  HalfWaySpringAnimator.swift
//  TryAnimation
//
//  Created by 劉韋呈 on 2017/3/30.
//  Copyright © 2017年 劉韋呈. All rights reserved.
//

import UIKit

class HalfWaySpringAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.75
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let screen: (from: ViewController, to: ViewController) =
            (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController,
             transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController)
        let containerView = transitionContext.containerView
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        let translation = CGAffineTransform.identity
        let moveUpTranslation = translation.translatedBy(x: 0, y: -200)
        let moveDownTranslation = translation.translatedBy(x: 0, y: 200)
        
        var toView = screen.to.view
        
        if transitionContext.responds(to: #selector(UIViewControllerTransitionCoordinatorContext.view(forKey:))) {
            toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        }
        
        toView?.alpha = 0.0
        screen.to.topView.transform = moveUpTranslation
        screen.to.bottomView.transform = moveDownTranslation
        
        containerView.addSubview(toView!)
        
        UIView.animate(withDuration: transitionDuration, animations: { 
            screen.from.topView.transform = moveUpTranslation
            screen.from.bottomView.transform = moveDownTranslation
            screen.from.topView.alpha = 0.0
            screen.from.bottomView.alpha = 0.0
        }) { (finished) in
            UIView.animate(withDuration: transitionDuration, animations: { 
                screen.to.topView.transform = moveDownTranslation
                screen.to.bottomView.transform = moveUpTranslation
                screen.to.topView.alpha = 1.0
                screen.to.bottomView.alpha = 1.0
                toView?.alpha = 1.0
            }, completion: { (finished) in
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            })
        }
    }
}
