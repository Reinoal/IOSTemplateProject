//
//  String+Extension.swift
//  MobileCheck
//
//  Created by RDX on 2019/3/13.
//  Copyright © 2019 sss. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    

    static func firstLetterFromString(aString:String)->String{
        
        let mutabStr = NSMutableString.init(string: aString)
        
        CFStringTransform(mutabStr, nil, kCFStringTransformToLatin, false)
        
        //去掉声调
        let pinyinString = mutabStr.folding(options: String.CompareOptions.diacriticInsensitive, locale: NSLocale.current)

        //将拼音首字母换成大写
        let strPinYin = polyphoneStringHandle(nameString: aString, pinyinString: pinyinString).uppercased()

//        //截取大写首字母
//        let firstString = strPinYin.first ?? "A"//prefix(upTo: strPinYin.startIndex).description//strPinYin.substring(to:strPinYin.index(strPinYin.startIndex, offsetBy: 1))
//
//        //判断首字母是否为大写
//        let regexA = "^[A-Z]$"
//        let predA = NSPredicate.init(format: "SELF MATCHES %@", regexA)
        return strPinYin.first != nil ? strPinYin.first!.description : "#" //predA.evaluate(with: firstString) ? firstString.description : "#"
    }
    
    //多音字处理，根据需要添自行加
    private static func polyphoneStringHandle(nameString: String, pinyinString: String) -> String {
        if nameString.hasPrefix("长") {return "chang"}
        if nameString.hasPrefix("沈") {return "shen"}
        if nameString.hasPrefix("厦") {return "xia"}
        if nameString.hasPrefix("地") {return "di"}
        if nameString.hasPrefix("重") {return "chong"}
        return pinyinString
    }
    
    public var imageArray:[String]{
        
        return self.components(separatedBy: ",").filter({ (s) -> Bool in
            return s != ""
        })
    }
    
    public var md5:String{
    
        let cStrl = cString(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        let strLen = CUnsignedInt(lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStrl!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return hash as String
        
    }
    
    public func sizeWith(_ width:CGFloat, font:UIFont)->CGSize {
        return self.boundingRect(with: CGSize.init(width: width, height: CGFloat(MAXFLOAT)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
    
    public var dateFormatString:String{
        
        if let dateTime = Int(self){
            
            if dateTime == 0 {
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd"
                return format.string(from: Date())
            }
            else
            {
                let date = Date.init(timeIntervalSince1970: TimeInterval(dateTime))
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd"
                return format.string(from: date)
            }
            
        }
        return ""
    }
    
    public var dateDetailFormatString:String{
        
        if let dateTime = Int(self){
            
            if dateTime == 0 {
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd HH:mm:ss"
                return format.string(from: Date())
            }
            else
            {
                let date = Date.init(timeIntervalSince1970: TimeInterval(dateTime))
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd HH:mm:ss"
                return format.string(from: date)
            }
            
        }
        return ""
    }
    
    public var dateAndTimeFormatString:String{
        
        if let dateTime = Int(self){
            
            if dateTime == 0 {
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd HH:mm"
                return format.string(from: Date())
            }
            else
            {
                let date = Date.init(timeIntervalSince1970: TimeInterval(dateTime))
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd HH:mm"
                return format.string(from: date)
            }
            
        }
        return ""
    }
    
    public var monthDayFormatString:String{
        
        if let dateTime = Int(self){
            
            if dateTime == 0 {
                return ""
            }
            else
            {
                let date = Date.init(timeIntervalSince1970: TimeInterval(dateTime))
                let format = DateFormatter()
                format.dateFormat = "MM月dd日"
                return format.string(from: date)
            }
            
        }
        return ""
    }
    
    static func mixAttrString(normalStr:String, attrString:String, attrColor:UIColor, attrFont:UIFont)->NSAttributedString{
        
        let attr = NSMutableAttributedString.init(string: normalStr)
        attr.append(NSAttributedString.init(string: attrString, attributes: [NSAttributedString.Key.foregroundColor : attrColor, NSAttributedString.Key.font : attrFont]))
        return attr
    }
    
    var removeHeadAndTailSpace:String {
        let whitespace = NSCharacterSet.whitespaces
        return self.trimmingCharacters(in: whitespace)
    }
    
    // 移除emoji
    func removeEmoji() -> String {
        let pattern = "[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]"
        return self.pregReplace(pattern: pattern, with: "")
    }
    
    //使用正则表达式替换
   func pregReplace(pattern: String, with: String,
                    options: NSRegularExpression.Options = []) -> String {
       let regex = try! NSRegularExpression(pattern: pattern, options: options)
       return regex.stringByReplacingMatches(in: self, options: [],
                                             range: NSMakeRange(0, self.count),
                                             withTemplate: with)
   }
    
    /// 价格或重量输入，限定为整数6位，小数点两位
    /// - Parameter willInsertString: 将要输入的字符串
    func numberStringMatchFormart(willInsertString:String) -> Bool {
        
        let str = self + willInsertString
        
        let pattern = "^[0-9]{1,6}+([.]+[0-9]{0,2}){0,1}$"
        
        let regex = try? NSRegularExpression.init(pattern: pattern, options: [])
        
        if let results = regex?.matches(in: str, options: [], range: NSRange.init(location: 0, length: str.count)){
            
            if results.isEmpty{
                return false
            }
            else
            {
                return true
            }
        }
        return false
    }
}
