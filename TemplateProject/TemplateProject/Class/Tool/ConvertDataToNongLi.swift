//
//  ConvertDataToNongLi.swift
//  MobileCheck
//
//  Created by RDX on 2019/8/8.
//  Copyright © 2019 sss. All rights reserved.
//

import UIKit

//跟FSCalendar一起使用
//func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//
//    return ConvertDataToNongLi().convertDateToNongli(date: date)
//}
class ConvertDataToNongLi: NSObject {

    private var dateFormart:DateFormatter = {
        
        let d = DateFormatter()
        d.dateFormat = "M"
        return d
    }()
    
    private lazy var calender:NSCalendar = {
        
        return NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.chinese)!
    }()
    
    private lazy var days:[String] = {
        
        return ["初二","初三","初四","初五","初六","初七","初八","初九","初十","十一","十二","十三","十四","十五","十六","十七","十八","十九","二十","廿一","廿二","廿三","廿四","廿五","廿六","廿七","廿八","廿九","三十"]
    }()
    
    private lazy var monthes:[String] = {
        return ["正月","二月","三月","四月","五月","六月","七月","八月","九月","十月","冬月","腊月"]
    }()
    
    func convertDateToNongli(date:Date)->String{
        let day = calender.component(.day, from: date)
        
        if day != 1{
            return days[day - 2]
        }
        
        var monthStr = NSString.init(string: dateFormart.string(from: date))
        if calender.veryShortMonthSymbols.contains(monthStr as String){
            return monthes[monthStr.integerValue - 1]
        }
        
        let month = calender.component(.month, from: date)
        monthStr = String.init("闰\(monthes[month - 1])") as NSString
        return monthStr as String
    }
}
