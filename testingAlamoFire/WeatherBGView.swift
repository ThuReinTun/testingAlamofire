//
//  File.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/29/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import Foundation
import UIKit

class WeatherBGView : UIView {
    
    func makeCustomRoundBorders (corners: UIRectCorner, radius: CGFloat, fillColor: UIColor, borderColor: UIColor, borderWidth: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
//        
//        let borderLayer = CAShapeLayer()
//        borderLayer.path = mask.path
////        borderLayer.backgroundColor = fillColor.cgColor
////        borderLayer.strokeColor = borderColor.cgColor
//        borderLayer.lineWidth = borderWidth
//        borderLayer.frame = bounds
//        self.layer.addSublayer(borderLayer)
    }
}
