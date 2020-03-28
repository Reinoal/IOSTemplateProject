//
//  Notification.name+Extension.swift
//  MobileCheck
//
//  Created by RDX on 2019/4/2.
//  Copyright © 2019 sss. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    
    public static var workbenchItemSelected:Notification.Name{
        return Notification.Name(rawValue: "workbenchItemSelected")
    }
    
    public static var UserStatusChangeNotification:Notification.Name{
        return Notification.Name(rawValue: "UserStatusChangeNotification")
    }
    
    public static var connectionTypeChanged:Notification.Name{
        return Notification.Name(rawValue: "connectionTypeChanged")
    }
}
