//
//  UIColor+Extension.swift
//  MobileCheck
//
//  Created by RDX on 2019/3/12.
//  Copyright © 2019 Rendetion. All rights reserved.
//

import Foundation
import UIKit



extension UIColor {
    
    open class func colorWith(r:CGFloat, g:CGFloat, b:CGFloat)->UIColor {
        return UIColor.init(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
    
    open class var randomColor:UIColor {
        
        return UIColor.colorWith(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
    }
    
}
