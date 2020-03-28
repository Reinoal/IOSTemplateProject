//
//  SVProgressHUD+Extension.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/28.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit

///改成自己想要的显示样式
class SVProgressHUD_Extension: NSObject {

    static func showInfo(withStatus: String?){
        SVProgressHUD.setMinimumSize(CGSize.init(width: 80, height: 80))
        SVProgressHUD.setBackgroundColor(.red)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setFont(UIFont.bold_15)
        SVProgressHUD.setMaximumDismissTimeInterval(2.5)
        SVProgressHUD.showInfo(withStatus: withStatus)
    }
}
