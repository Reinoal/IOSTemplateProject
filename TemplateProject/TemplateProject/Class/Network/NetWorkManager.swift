//
//  NetWorkManager.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/21.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit
import Alamofire
import Reachability

typealias callBackHandler = (_ success: Bool, _ responseData: Any?) ->Void

typealias resultHandler = (_ success: Bool, _ resultMessage: String?) ->Void

class NetWorkManager: NSObject {

    static let manager: NetWorkManager = {return NetWorkManager()}();private override init() {}
    
    enum ErrorString: String {
        
        case 请求成功
        case 请求超时
        case 网络不可用
        case 无网络
        case 参数错误
        case 未知错误
        case 服务器无响应
        case 参数号序列化错误
    }
    
    enum ConnectionType: String {
        case none
        case wifi
        case cellular
        case unavailable
    }
    
    var m_connectionType: ConnectionType {get {return pm_connectionType}}
    
    var m_timeoutIntervar: TimeInterval = 10
    
    private var pm_connectionType: ConnectionType = .none
    
    func startManager(){
        //网络状态监听
        NotificationCenter.default.addObserver(self, selector: #selector(connectChanged), name: Notification.Name.connectionTypeChanged, object: nil)
    }
    
    func stopManager(){
        NotificationCenter.default.removeObserver(self)
    }
    
    //网络状态改变设置
    @objc private func connectChanged(obj:Notification){
        
        if let reac = obj.userInfo as? Dictionary<String, ConnectionType>{
            
            switch reac.values.first! {
                
            case .cellular:
                pm_connectionType = .cellular
                break
                
            case .none:
                pm_connectionType = .none
                break
                
            case .wifi:
                pm_connectionType = .wifi
                break
                
            case .unavailable:
                pm_connectionType = .unavailable
                break
            }
        }
    }
    
    func sendRequest(param: Dictionary<String, AnyObject>, requestURL: String, _ method: String = "POST", completeHandler: @escaping callBackHandler){
        
        switch  m_connectionType{
        case .none:
            completeHandler(false, ErrorString.无网络)
            return
            
        case .unavailable:
            completeHandler(false, ErrorString.网络不可用)
            return
            
        default:
            break
        }
        
        var request = URLRequest.init(url: URL.init(string: requestURL)!)
        
        request.timeoutInterval = m_timeoutIntervar
        
        do {
             request.httpBody = try JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch  {
           debugPrint(error.localizedDescription)
            completeHandler(false, ErrorString.参数号序列化错误)
        }
        request.httpMethod = method
        
        self.request(urlRequest: request, completeHandler: completeHandler)
    }
    
    
    fileprivate func request(urlRequest: URLRequest, completeHandler:@escaping callBackHandler){
        
        Alamofire.request(urlRequest).responseJSON(queue: DispatchQueue.main, options: JSONSerialization.ReadingOptions.allowFragments) { (responseData) in
            
            switch responseData.result{
                
            case .success:
                completeHandler(true, responseData.result.value)
                break
                
            case .failure:
                completeHandler(false, responseData.result.value)
                break
            }
        }
    }
}
