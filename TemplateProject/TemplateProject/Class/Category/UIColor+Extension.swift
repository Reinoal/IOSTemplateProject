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
    
    open class var mainColor:UIColor {
        return UIColor.colorWith(r: 0, g: 125, b: 245)
    }
    
    
    open class var mainBGColor:UIColor {
        return UIColor.colorWith(r: 240, g: 240, b: 240)
    }
    
    open class var workbenchHeaderColor:UIColor{
        return UIColor.colorWith(r: 0, g: 64, b: 111)
    }
    
    open class var fontBlackColor:UIColor {
        return UIColor.colorWith(r: 100, g: 100, b: 100)
    }
    
    open class var workbenchBGColor:UIColor {
        return UIColor.colorWith(r: 0, g: 56, b: 100)
    }
    
    open class var fontLightGrayColor:UIColor {
        return UIColor.colorWith(r: 140, g: 140, b: 140)
    }
    
    open class var light200:UIColor {
        return UIColor.colorWith(r: 200, g: 200, b: 200)
    }
    
    open class var black100:UIColor {
        return UIColor.colorWith(r: 100, g: 100, b: 100)
    }
    
    open class var black150:UIColor {
        return UIColor.colorWith(r: 150, g: 150, b: 150)
    }
    
    open class var black80:UIColor {
        return UIColor.colorWith(r: 80, g: 80, b: 80)
    }
}
