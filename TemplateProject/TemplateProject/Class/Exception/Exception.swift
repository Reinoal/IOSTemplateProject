//
//  Exception.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/21.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit


/// 自定义异常
public enum Exception: Error {
    
    
    enum EArray {
        case indexError         //下标越界
        case rangeError         //范围越界
    }
    
    enum EData {
        case serializationFail //序列化失败
    }
    
    enum Server {
        case columnError        //服务器返回的字段被修改解析不了数据
        case dataFormatError    //数据格式错误
    }
    
    case unknowError        //未知异常
}
    
    
    
    

