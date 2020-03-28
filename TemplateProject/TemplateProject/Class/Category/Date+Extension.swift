//
//  Date+Extension.swift
//  MobileCheck
//
//  Created by RDX on 2019/7/1.
//  Copyright © 2019 sss. All rights reserved.
//

import UIKit

extension Date{
    
    public var chineseDate: Date {
        
        return self.addingTimeInterval(8 * 60 * 60)
    }
    
    func dateFormatString()->String{
    
        let formart = DateFormatter()
        formart.dateFormat = "yyyy-MM-dd"
        return formart.string(from: self)
    }
    
    public func dateToIntTimeInterval()->Int{
        
        return Int(self.timeIntervalSince1970)
    }
    
    //本月开始日期
    func startOfCurrentMonth() -> Date {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.year, .month]), from: date)
        let startOfMonth = calendar.date(from: components)!
        return startOfMonth.addingTimeInterval(8 * 60 * 60)
    }
    
    //本月结束日期
    func endOfCurrentMonth(returnEndTime:Bool = false) -> Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.month = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
        
        let endOfMonth =  calendar.date(byAdding: components, to: startOfCurrentMonth())!
        return endOfMonth.addingTimeInterval(8 * 60 * 60)
    }
    
    //本年开始日期
    func startOfCurrentYear() -> Date {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(Set<Calendar.Component>([.year]), from: date)
        let startOfYear = calendar.date(from: components)!
        return startOfYear.addingTimeInterval(8 * 60 * 60)
    }
    
    //本年结束日期
    func endOfCurrentYear(returnEndTime:Bool = false) -> Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.year = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
        
        let endOfYear = calendar.date(byAdding: components, to: startOfCurrentYear())!
        return endOfYear.addingTimeInterval(8 * 60 * 60)
    }
    
    //指定年月的开始日期
    func startOfMonth(year: Int, month: Int) -> Date {
        let calendar = NSCalendar.current
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        let startDate = calendar.date(from: startComps)!
        return startDate.addingTimeInterval(8 * 60 * 60)
    }
    
    //指定年月的结束日期
    func endOfMonth(year: Int, month: Int, returnEndTime:Bool = false) -> Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.month = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
        
        let endOfYear = calendar.date(byAdding: components,
                                      to: startOfMonth(year: year, month:month))!
        return endOfYear.addingTimeInterval(8 * 60 * 60)
    }
}
