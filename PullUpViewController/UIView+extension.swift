//
//  UIView+extension.swift
//  PullUpViewController
//
//  Created by Ethan on 2018/7/27.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorner(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
