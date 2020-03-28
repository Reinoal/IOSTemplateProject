//
//  UIView+Extension.swift
//  pokergame
//
//  Created by 000 on 2018/7/31.
//  Copyright © 2018 000. All rights reserved.
//

import UIKit

//public let navigationBarHeight:CGFloat = isIPhoneX ? 84 : 64

public let navigationBarWithoutStatusBarHeight = 44

extension UIView{

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var x:CGFloat {
        
        set{
            
            var rect = frame
            
            rect.origin.x = newValue
            
            frame = rect
        }
        
        get{
            
            return frame.origin.x
        }
    }
    
    @IBInspectable var y:CGFloat {
        
        set{
            
            var rect = frame
            
            rect.origin.y = newValue
            
            frame = rect
        }
        
        get{
            
            return frame.origin.y
        }
    }
    
    @IBInspectable var size:CGSize {
        
        set{
            
            var rect = frame
            
            rect.size = newValue
            
            frame = rect
        }
        
        get{
            
            return frame.size
        }
    }
    
    @IBInspectable var maxX:CGFloat {
        
        get{
            
            return frame.maxX
        }
    }
    
    @IBInspectable var maxY:CGFloat {
        
        
        get{
            
            return frame.maxY
        }
    }
    
    @IBInspectable var width:CGFloat {
        
        set{
            
            var rect = frame
            
            rect.size.width = newValue
            
            frame = rect
        }
        
        get{
            
            return frame.size.width
        }
    }
    
    @IBInspectable var height:CGFloat {
        
        set{
            
            var rect = frame
            
            rect.size.height = newValue
            
            frame = rect
        }
        
        get{
            
            return frame.size.height
        }
    }

    
//    @IBInspectable var IphoneXTopSafeAreaHeight:CGFloat{
//        return isIPhoneX ? 44 : 0
//    }
//    
//    @IBInspectable var IphoneXBottomSafeAreaHeight:CGFloat{
//        
//        return isIPhoneX ? 34 : 0
//    }
//    
//    @IBInspectable var IphoneXBottomSafeAreaWithStatusBarHeight:CGFloat{
//        
//        return isIPhoneX ? 54 : 0
//    }
    
    @IBInspectable var statusBarMaxY:CGFloat{
        
        return 20
    }
    

    open func shadowWith(_ color:UIColor, opacity:Float, shadowRadius:CGFloat, offSet:CGSize){
        
        self.layer.shadowColor = color.cgColor
        
        self.layer.shadowOffset = offSet
        
        self.layer.shadowRadius = shadowRadius
        
        self.layer.shadowOpacity = opacity
        
        self.layer.masksToBounds = false
    }
    
    ///渐变色
    open func gradientColors(color1:UIColor, color2:UIColor){
        
        let layer = CAGradientLayer()
        layer.colors = [color1.cgColor, color2.cgColor]
        
        layer.startPoint = CGPoint.init(x: 0, y: 0)
        
        layer.endPoint = CGPoint.init(x: 1, y: 0)
        
        layer.frame = self.bounds
        
        self.layer.insertSublayer(layer, at: 0)
    }
}
