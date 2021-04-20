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
    
    convenience init(title:String?, font:UIFont?, bgColor:UIColor?,titleColor:UIColor?, radius:CGFloat) {
        self.init()
        setTitle(title, for: .normal)
        titleLabel?.font = font
        backgroundColor = bgColor
        setTitleColor(titleColor, for: .normal)
        radius > 0 ? cornerRadius = radius : nil
    }
    
    
    convenience init(image:String, selectedImage:String?) {
        self.init()
        setImage(UIImage.init(named: image), for: .normal)
        selectedImage != nil && selectedImage!.removeHeadAndTailSpace != "" ? setImage(UIImage.init(named: selectedImage!), for: .selected) : nil
    }
    
    convenience init(title:String?, titleColor:UIColor, font:UIFont, selector:Selector, target:Any?) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        addTarget(target, action: selector, for: .touchUpInside)
    }
    
    convenience init(title:String, selectedTitle:String, titleColor:UIColor, selectedTitleColor:UIColor, font:UIFont, target:Any?, selector:Selector) {
        self.init()
        titleLabel?.font = font
        setTitle(title, for: .normal)
        setTitle(selectedTitle, for: .selected)
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selectedTitleColor, for: .selected)
        addTarget(target, action: selector, for: .touchUpInside)
    }
    
    convenience init(title: String, _ color: UIColor = .black, _ font: UIFont = .font_16, _ bgColor: UIColor = .white, _ radius: CGFloat = 0, _ borderColor: UIColor = .clear){
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        titleLabel?.font = font
        backgroundColor = bgColor
        cornerRadius = radius
        borderWidth = radius == 0 ? 0 : 1
        self.borderColor = borderColor
    }
    
}
