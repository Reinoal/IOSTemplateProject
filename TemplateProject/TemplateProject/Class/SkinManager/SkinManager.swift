//
//  SkinManager.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/20.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit

class SkinManager: NSObject {

    static let manager: SkinManager = {return SkinManager()}(); private override init() {}
    
    enum Skin {
        case red
        case blue
        case yellow
        case gray
    }
}


