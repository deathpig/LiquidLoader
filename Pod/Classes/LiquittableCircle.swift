//
//  LiquittableCircle.swift
//  LiquidLoading
//
//  Created by Takuma Yoshida on 2015/08/17.
//  Copyright (c) 2015年 yoavlt. All rights reserved.
//

import Foundation
import UIKit

class LiquittableCircle : UIView {
    
    var points: [CGPoint] = []
    var isGrow = false {
        didSet {
            grow(isGrow)
        }
    }
    var radius: CGFloat {
        didSet {
            setup()
        }
    }
    var color: UIColor = UIColor.red
    var growColor: UIColor = UIColor.white

    init(center: CGPoint, radius: CGFloat, color: UIColor, growColor: UIColor?) {
        let frame = CGRect(x: center.x - radius, y: center.y - radius, width: 2 * radius, height: 2 * radius)
        self.radius = radius
        self.color = color
        if growColor != nil {
            self.growColor = growColor!
        }
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func move(_ dt: CGPoint) {
        let point = CGPoint(x: center.x + dt.x, y: center.y + dt.y)
        self.center = point
    }

    fileprivate func setup() {
        self.frame = CGRect(x: center.x - radius, y: center.y - radius, width: 2 * radius, height: 2 * radius)
        let bezierPath = UIBezierPath(ovalIn: CGRect(origin: CGPoint.zero, size: CGSize(width: radius * 2, height: radius * 2)))
        draw(bezierPath)
    }

    func draw(_ path: UIBezierPath) {
        self.layer.sublayers?.each { $0.removeFromSuperlayer() }
        let layer = CAShapeLayer(layer: self.layer)
        layer.lineWidth = 3.0
        layer.fillColor = self.color.cgColor
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
        if isGrow {
            grow(true)
        }
    }
    
    func grow(_ isGrow: Bool) {
        if isGrow {
            grow(self.growColor, radius: self.radius, shininess: 1.6)
        } else {
            self.layer.shadowRadius = 0
            self.layer.shadowOpacity = 0
        }
    }

    func circlePoint(_ rad: CGFloat) -> CGPoint {
        return CGMath.circlePoint(center, radius: radius, rad: rad)
    }

}
