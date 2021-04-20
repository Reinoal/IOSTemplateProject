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
    
    convenience init(title: String? = "",font: UIFont? = UIFont.font_16, color: UIColor? = UIColor.black, _ bgColor: UIColor? = UIColor.white, _ radius: CGFloat = 0) {
        self.init()
        text = title
        self.font = font
        textColor = color
        backgroundColor = bgColor
        cornerRadius = radius
    }
}
