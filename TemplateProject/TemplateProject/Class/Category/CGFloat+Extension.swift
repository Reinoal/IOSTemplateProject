//
//  CGFloat+Extension.swift
//  MobileCheck
//
//  Created by RDX on 2019/3/11.
//  Copyright © 2019 Rendetion. All rights reserved.
//

import UIKit

extension CGFloat {
    
    public static var tabBarHeight:CGFloat{
        if let vs = UIApplication.shared.keyWindow?.rootViewController?.view.subviews {
                
           let tabBars = vs.filter { (v) -> Bool in
                return v.isKind(of: UITabBar.classForCoder())
            }
            
            if let tabBar = tabBars.first {
                
                return tabBar.height
            }
            else
            {
                return 0
            }
        }
        return 0
    }
    
    public static var statusBarHeight:CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
    
    public static var screenWidth:CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public static var screenHeight:CGFloat{
        return UIScreen.main.bounds.height
    }
    
}
