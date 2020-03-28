//
//  AppDelegate.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/21.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit
import Reachability

private let connectionTypeChangedKey = "connectionTypeChangedKey"

/// log 打印
public func DebugLog<T>(_ message:T, fileName:String = #file, method:String = #function, line:Int = #line){
    #if DEBUGE
    
    print("时间：\(Date().addingTimeInterval(8 * 60 * 60)) -->调用方法：\(method)﹣﹣行号[\(line)]:\(message)\n")
    
    #endif
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var netListenner:Reachability = try! Reachability.init()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        NetWorkManager.manager.startManager()
        //网络状态监听
        NotificationCenter.default.addObserver(self, selector: #selector(connectChanged), name: Notification.Name.reachabilityChanged, object: netListenner)
        
        try? netListenner.startNotifier()
        
        
        return true
    }

    //网络状态改变设置
    @objc private func connectChanged(obj:Notification){
        
        if let reac = obj.object as? Reachability{
            
            switch reac.connection {
                
            case .cellular:
                NotificationCenter.default.post(name: NSNotification.Name.connectionTypeChanged, object: nil, userInfo: [connectionTypeChangedKey:NetWorkManager.ConnectionType.cellular])
                break
                
            case .none:
                NotificationCenter.default.post(name: NSNotification.Name.connectionTypeChanged, object: nil, userInfo: [connectionTypeChangedKey:NetWorkManager.ConnectionType.none])
                break
                
            case .wifi:
                NotificationCenter.default.post(name: NSNotification.Name.connectionTypeChanged, object: nil, userInfo: [connectionTypeChangedKey:NetWorkManager.ConnectionType.wifi])
                break
                
            case .unavailable:
                NotificationCenter.default.post(name: NSNotification.Name.connectionTypeChanged, object: nil, userInfo: [connectionTypeChangedKey:NetWorkManager.ConnectionType.unavailable])
                break
            }
        }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    func applicationWillTerminate(_ application: UIApplication) {
        netListenner.stopNotifier()
        NetWorkManager.manager.stopManager()
    }
}

