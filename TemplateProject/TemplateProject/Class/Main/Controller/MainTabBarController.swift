//
//  MainTabBarController.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/20.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit



class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addChildController(HomeViewController(), title: "首页", titleColor: .lightText, selectedColor: .orange, image: "", selectedImage: "")
        addChildController(MultipleViewController(), title: "首页2", titleColor: .lightText, selectedColor: .orange, image: "", selectedImage: "")
    }
    

    
    
    func addChildController(_ controller:UIViewController, title:String, titleColor: UIColor, selectedColor: UIColor, _ font: UIFont = .font_12, image:String, selectedImage:String){
        
        //注意，不设置图片时，title的样式无效
        
        controller.title = title
        
        controller.tabBarItem.image = UIImage.add.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        controller.tabBarItem.selectedImage = UIImage.actions.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : titleColor, NSAttributedString.Key.font: font], for: UIControl.State.normal)
        
        controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : selectedColor, NSAttributedString.Key.font:font], for: UIControl.State.selected)
        
        let nav = MainNavigationController.init(rootViewController: controller)
        
        addChild(nav)
    }
}
