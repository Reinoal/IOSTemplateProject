//
//  launchManager.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/20.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift


class launchManager: NSObject {
    
    static let manager: launchManager = launchManager()
    
    private override init() {}
    
    func lauchController() -> UIViewController{
        
        return MainTabBarController()
    }
    
    func loadLauchConfig(){
        
        configKeyboardManager()
    }
    
    
    //MARK: 私有
    fileprivate func configKeyboardManager(){
        
        IQKeyboardManager.shared.enable = true
    }
}
