//
//  CustomPopAnimator.swift
//  vk
//
//  Created by Alexandr Evtodiy on 12.09.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class CustomPopAnimator:NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        destination.view.frame = source.view.frame
        
        let translation = CGAffineTransform(translationX: -(source.view.frame.height + source.view.frame.width)/2, y: -(source.view.frame.height - source.view.frame.width)/2)
        let rotate = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        destination.view.transform = rotate.concatenating(translation)

        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 1,
                                                       animations: {
                                 
                                                        let translation = CGAffineTransform(translationX: (source.view.frame.height + source.view.frame.width)/2, y: -(source.view.frame.height - source.view.frame.width)/2)
                                                        let rotate = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                                                        source.view.transform = rotate.concatenating(translation)
                                                        
                                    })

                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 1,
                                                       animations: {
                                                           destination.view.transform = .identity
                                    })
                                    
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
