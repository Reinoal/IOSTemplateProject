//
//  UIButton+Extension.swift
//  MobileCheck
//
//  Created by RDX on 2019/3/12.
//  Copyright © 2019 Rendetion. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    open class func buttonWith(title:String, font:UIFont, bgColor:UIColor?,titleColor:UIColor, cornerRadius:CGFloat)->UIButton{
        
        let b = UIButton.init(type: .custom)
        b.setTitle(title, for: .normal)
        b.titleLabel?.font = font
        b.backgroundColor = bgColor
        b.setTitleColor(titleColor, for: .normal)
        if cornerRadius > 0{
            b.layer.masksToBounds = true
            b.layer.cornerRadius = cornerRadius
        }
        return b
    }
    
    open class func buttonWith(image:String, selectedImage:String?)->UIButton{
        
        let b = UIButton.init(type: .custom)
        b.setImage(UIImage.init(named: image), for: .normal)
        selectedImage != nil && selectedImage != "" ? b.setImage(UIImage.init(named: selectedImage!), for: .selected) : nil
        return b
    }
    
    open class func buttonWith(title:String?, titleColor:UIColor, font:UIFont, selector:Selector, target:Any?)->UIButton{
        
        let b = UIButton.init(type: .custom)
        b.setTitle(title, for: .normal)
        b.setTitleColor(titleColor, for: .normal)
        b.titleLabel?.font = font
        b.addTarget(target, action: selector, for: .touchUpInside)
        return b
    }
    
    open class func buttonLeftTitleRightImageWith(title:String?, titleColor:UIColor, font:UIFont, image:String, selectedImage:String?, selector:Selector, target:Any?)->UIButton{
        
        let b = UIButton.init(type: .custom)
        b.setImage(UIImage.init(named: image), for: .normal)
        if selectedImage != nil && selectedImage != ""{
            b.setImage(UIImage.init(named: selectedImage!), for: .selected)
        }
        b.setTitle(title, for: .normal)
        b.setTitleColor(titleColor, for: .normal)
        b.titleLabel?.font = font
        b.addTarget(target, action: selector, for: .touchUpInside)
        
        return b
    }
    
    open class func buttonWith(title:String, selectedTitle:String, titleColor:UIColor, selectedTitleColor:UIColor, font:UIFont, target:Any?, selector:Selector)->UIButton{
        
        let b = UIButton.init(type: .custom)
        b.titleLabel?.font = font
        b.setTitle(title, for: .normal)
        b.setTitle(selectedTitle, for: .selected)
        b.setTitleColor(titleColor, for: .normal)
        b.setTitleColor(selectedTitleColor, for: .selected)
        b.addTarget(target, action: selector, for: .touchUpInside)
        return b
    }
}
