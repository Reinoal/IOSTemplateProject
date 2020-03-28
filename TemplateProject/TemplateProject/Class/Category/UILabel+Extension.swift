//
//  UILabel+Extension.swift
//  MobileCheck
//
//  Created by RDX on 2019/3/25.
//  Copyright © 2019 sss. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    open class func lableWith(text:String?, textColor:UIColor, bgColor:UIColor?, cornerRadius:CGFloat)->UILabel{
    
        let l = UILabel()
        l.text = text
        l.textColor = textColor
        l.backgroundColor = bgColor == nil ? .clear : bgColor
        l.cornerRadius = cornerRadius
        
        return l
    }
    
    open class func lableWith(text:String?, textColor:UIColor, font:UIFont)->UILabel{
        
        let l = UILabel()
        l.text = text
        l.textColor = textColor
        l.font = font
        
        return l
    }
    
    open class func labelWith(_ title:String, titleColor:UIColor, font:UIFont, bgColor:UIColor)->UILabel{
        let l = UILabel()
        l.textColor = titleColor
        l.font = font
        l.text = title
        l.backgroundColor = bgColor
        
        return l
    }
    
    open class func labelWith(_ title:String?, titleColor:UIColor, font:UIFont)->UILabel{
        let l = UILabel()
        l.textColor = titleColor
        l.font = font
        l.text = title
        
        return l
    }
    
    open class func labelWith(_ title:String?, titleColor:UIColor)->UILabel{
        let l = UILabel()
        l.textColor = titleColor
        l.text = title
        
        return l
    }
}
