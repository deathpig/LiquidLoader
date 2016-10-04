//
//  UIColorEx.swift
//  LiquidLoading
//
//  Created by Takuma Yoshida on 2015/08/21.
//  Copyright (c) 2015年 yoavlt. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    var redComponent: CGFloat {
        get {
            let components = self.cgColor.components
            return components![0]
        }
    }
    
    var greenComponent: CGFloat {
        get {
            let components = self.cgColor.components
            return components![1]
        }
    }
    
    var blueComponent: CGFloat {
        get {
            let components = self.cgColor.components
            return components![2]
        }
    }
    
    var alphaComponent: CGFloat {
        get {
            return self.cgColor.alpha
        }
    }

    func alpha(_ alpha: CGFloat) -> UIColor {
        return UIColor(red: self.redComponent, green: self.greenComponent, blue: self.blueComponent, alpha: alpha)
    }
    
    func scale(_ scale: CGFloat) -> UIColor {
        return UIColor(red: self.redComponent * scale, green: self.greenComponent * scale, blue: self.blueComponent * scale, alpha: self.alphaComponent)
    }
}
