//
//  FilterViewController.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/9/21.
//

import UIKit

class FilterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController(_:)))
        self.transitioningDelegate = self

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//
//        transition.type = .reveal
//        transition.subtype = .fromBottom
//        navigationController?.view.layer.add(transition, forKey: kCATransition)
//        self.navigationController?.popViewController(animated: false)
       
    }
    
    @objc func dismissViewController(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension FilterViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.5, animationType: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 3.5, animationType: .dismiss)
    }
}
