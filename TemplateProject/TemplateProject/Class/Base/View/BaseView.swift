//
//  BaseView.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/27.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit
import SnapKit
class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }

    convenience init(bgColor: UIColor){
        self.init()
        backgroundColor = bgColor
    }
    
    func setView(){
        
    }
}
