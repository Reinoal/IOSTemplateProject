//
//  StyleManager.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/20.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit

///加载什么风格的界面管理
class StyleManager: NSObject{
    
    static let manager: StyleManager = {return StyleManager()}();private override init() {}
    
    enum Style {
        case simple1
        case simple2
        case simple3
    }
    
}
