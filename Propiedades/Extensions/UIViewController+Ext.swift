//
//  UIViewController+Ext.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/8/21.
//

import UIKit
extension UIViewController {
    func addTapGesture() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        print("dismiss keyboard")
    }
    
}
