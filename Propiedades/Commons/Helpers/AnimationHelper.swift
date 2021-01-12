//
//  AnimationHelper.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/10/21.
//

import UIKit
struct AnimationHelper {
    static func yRotation(_ angle: Double) -> CATransform3D {
        //(angle, x, y, z)
        return CATransform3DMakeRotation(CGFloat(angle), 0.0, 1.0, 0.0)
    }
    /*
        | 1 0 0 0 |      | m11 m12 m13 m14   |
    I = | 0 1 0 0 |      | m21 m22 m23 m24   |
        | 0 0 1 0 |   =  | m31 m32 m33 {m34} |
        | 0 0 0 1 |      | m41 m42 m43 m44   |
     */
    static func persperctiveTranform(for containerView: UIView) {
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        containerView.layer.sublayerTransform = transform
    }
}
