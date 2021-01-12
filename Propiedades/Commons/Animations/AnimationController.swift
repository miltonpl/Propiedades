//
//  AnimationController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/9/21.
//

import UIKit

class AnimationController: NSObject {
    // MARK: - Properties
    private let animationDuration: Double
    private let animationType: AnimationType
    
    enum AnimationType {
        case present
        case dismiss
    }
    
    // MARK: - Initialization
    init(animationDuration: Double, animationType: AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = animationType
    }
}

// MARK: - View Controller Animation
extension AnimationController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        TimeInterval(exactly: self.animationDuration) ?? 0.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to), let fromViewController = transitionContext.viewController(forKey: .from) else {
            return transitionContext.completeTransition(false)
        }
        
        switch self.animationType {
        case .present:
            print("Present")
            transitionContext.containerView.addSubview(toViewController.view)
            self.prensentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
        case .dismiss:
            print("Present")
            transitionContext.containerView.addSubview(toViewController.view)
            transitionContext.containerView.addSubview(fromViewController.view)
            self.dismissAnimation(with: transitionContext, viewToAnimation: fromViewController.view)
        }
    }
    
    func prensentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveEaseInOut) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        } completion: { isCompleted in
            print("isCompleted: \(isCompleted)")
            transitionContext.completeTransition(isCompleted)
        }
    }
    func dismissAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimation: UIView) {
        let duration = self.transitionDuration(using: transitionContext)
        let scaleDown = CGAffineTransform(scaleX: 0.3, y: 0.3)
        let moveOut = CGAffineTransform(translationX: -viewToAnimation.frame.width, y: 0)
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeLinear) {
            
            //1
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7) {
                viewToAnimation.transform = scaleDown
            }
            //2
            UIView.addKeyframe(withRelativeStartTime: 3.0/duration, relativeDuration: 1.0) {
                viewToAnimation.transform = scaleDown.concatenating(moveOut)
                viewToAnimation.alpha = 0
            }
        } completion: { status in
            print("status \(status)")
            transitionContext.completeTransition(true)
        }
    }
}
