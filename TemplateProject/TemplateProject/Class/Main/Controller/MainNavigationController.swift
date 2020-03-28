//
//  MainNavigationController.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/20.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fd_fullscreenPopGestureRecognizer.isEnabled = true
        
//        navigationBar.setBackgroundImage(UIImage.imageWith(navColor), for: UIBarMetrics.default)
//
//        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font : UIFont.font_20]
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
//            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "common_back")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: .done, target: self, action: #selector(back))
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }

    
//    @objc private func back(){
//        popViewController(animated: true)
//    }
    
}
