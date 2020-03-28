//
//  TextInputVerify.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/28.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit

class TextInputVerify: NSObject {

    enum CharType {
        case letter
        case number
        case symbol
        case chinese
        case emoji
        case blank
    }
    
    ///验证手机号码
    static func verifyPhoneNumber(_ number: String) -> Bool{
        
        if number.count != 11{
            SVProgressHUD.showError(withStatus: "电话号码为11位数")
            return false
        }
        
        if let reg = try? NSRegularExpression.init(pattern: "^1([38]\\d|5[0-35-9]|7[3678])\\d{8}$", options: NSRegularExpression.Options.caseInsensitive){
            
            let result = reg.matches(in: number, options: [], range: NSRange.init(location: 0, length: number.count))
                
            if !result.isEmpty {
                return true
            }
            SVProgressHUD.showError(withStatus: "电话号码输入错误")
            return false
        }
        SVProgressHUD.showError(withStatus: "电话号码输入错误")
        return false
    }
    
    ///验证密码
    static func verifyPassword(_ pw: String) -> Bool{
        //验证字符数
        if pw.count > 16 || pw.count < 8{
            SVProgressHUD.showError(withStatus: "密码长度为8到16个字符")
            return false
        }
        
        //验证中文
        for s in pw {
            if ("\u{4E00}" <= s  && s <= "\u{9FA5}") {
                SVProgressHUD.showError(withStatus: "密码不能包含中文")
                return false
            }
        }
        
        //验证开头
        if let reg = try? NSRegularExpression.init(pattern: "^(_|[A-Za-z])+", options: NSRegularExpression.Options.caseInsensitive){
            
            let result = reg.matches(in: pw, options: [], range: NSRange.init(location: 0, length: pw.count))
                
            if !result.isEmpty {
                
                if pw.first! == "_"{

                    if verifyChars(pw, type: .letter) {
                        
                        if verifyChars(pw, type: .number){
                            
                            SVProgressHUD.showSuccess(withStatus: "密码验证通过")
                        }
                        else
                        {
                            SVProgressHUD.showError(withStatus: "必须包含数字")
                            return false
                        }
                    }
                    else
                    {
                        SVProgressHUD.showError(withStatus: "必须包含字母")
                        return false
                    }
                }
                else
                {
                    if verifyChars(pw, type: .symbol) {
                        
                        if verifyChars(pw, type: .number){
                            
                            SVProgressHUD.showSuccess(withStatus: "密码验证通过")
                        }
                        else
                        {
                            SVProgressHUD.showError(withStatus: "必须包含数字")
                            return false
                        }
                    }
                    else
                    {
                        SVProgressHUD.showError(withStatus: "必须包含特殊字符")
                        return false
                    }
                }
                
                return true
            }
            SVProgressHUD.showError(withStatus: "密码必须以下划线或字母开头")
            return false
        }
        
        return false
    }
    
    
    fileprivate static func verifyChars(_ text: String, type: CharType) -> Bool {
        
        var pat = ""
         
        switch type {
        case .letter:
            pat = "[a-zA-Z]+"
            break
        case .number:
            pat = "\\d+"
            break
        case .symbol:
            pat = "([_]+)|([@]+)|([#]+)|([$]+)|([%]+)|([&]+)|([*]+)"
            break
        case .chinese:
            break
        case .emoji:
            break
        case .blank:
            break
        }
        
        if let reg = try? NSRegularExpression.init(pattern: pat, options: NSRegularExpression.Options.caseInsensitive){
            
            let result = reg.matches(in: text, options: [], range: NSRange.init(location: 0, length: text.count))
                
            if !result.isEmpty {
                return true
            }
            return false
        }
        
        return false
    }
    
    
}
