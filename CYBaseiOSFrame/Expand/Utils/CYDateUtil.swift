//
//  CYDateUtil.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/29.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation

class CYDateUtil: NSObject {
    
    
    class func dateFormatterStrByM(dateStr:String)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date:NSDate = dateFormatter.date(from: dateStr)! as NSDate
        
        let showFormatter:DateFormatter = DateFormatter()
        showFormatter.dateFormat = "MM月dd日 HH:mm"
        return showFormatter.string(from: date as Date)
    }
    
    //根据时间字符转换为固定格式的时间字符串，精确到分钟 如：2015-12-21 22:10
    class func dateFormatterStrByS(dateStr:String)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date:NSDate = dateFormatter.date(from: dateStr)! as NSDate
        
        let showFormatter:DateFormatter = DateFormatter()
        showFormatter.dateFormat = "yyyy-MM-dd"
        return showFormatter.string(from: date as Date)
    }
    
    //根据时间字符转换为固定格式的时间字符串，精确到分钟 如：2015-12-21 22:10
    class func dateFormatterStr(dateStr:String)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date:NSDate = dateFormatter.date(from: dateStr)! as NSDate
        
        let showFormatter:DateFormatter = DateFormatter()
        showFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return showFormatter.string(from: date as Date)
    }
    
    //根据时间字符转换为固定格式的时间字符串如：2015-12-21
    class func dateFormatterDay(dateStr:String)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date:NSDate = dateFormatter.date(from: dateStr)! as NSDate
        
        let showFormatter:DateFormatter = DateFormatter()
        showFormatter.dateFormat = "yyyy-MM-dd"
        return showFormatter.string(from: date as Date)
    }
    
    //根据时间字符转换为固定格式的时间字符串，精确到分钟 如：22:10:11
    class func dateFormatterhms(dateStr:String)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let date:NSDate = dateFormatter.date(from: dateStr)! as NSDate
        
        let showFormatter:DateFormatter = DateFormatter()
        showFormatter.dateFormat = "HH:mm:ss"
        return showFormatter.string(from: date as Date)
    }
    
    //根据时间戳还原时间格式，精确到秒，如：2015-12-21 22:10:10
    class func restoreTimeFullString(date:TimeInterval)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let pointDate:NSDate = NSDate(timeIntervalSince1970: date)
        return dateFormatter.string(from: pointDate as Date)
    }
    
    //根据时间戳显示时间格式，精确到分钟，如：2015-12-21 22:10
    class func minuteFullString(date:Double)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let pointDate:NSDate = NSDate(timeIntervalSince1970: TimeInterval(date))
        return dateFormatter.string(from: pointDate as Date)
    }
    
    //根据时间戳显示时间格式，精确到分钟，如：12月21日 22:10
    class func jieMinuteFullString(date:Double)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat="MM月dd日 HH:mm"
        let pointDate:NSDate = NSDate(timeIntervalSince1970: TimeInterval(date))
        return dateFormatter.string(from: pointDate as Date)
    }
    
    //根据时间字符转换为1970年以来的时间戳(精确)，单位为秒
    class func dateTimestampExact(dateStr:String)->Double{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat="yyyy/MM/dd HH:mm:ss"
        let date:NSDate = dateFormatter.date(from: dateStr)! as NSDate
        return date.timeIntervalSince1970
    }
    
    
    //根据时间戳显示小时格式，如： 22:10
    class func hourString(date:Double)->String{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let pointDate:NSDate = NSDate(timeIntervalSince1970: TimeInterval(date))
        return dateFormatter.string(from: pointDate as Date)
    }
    
    //根据时间戳显示简要时间描述格式，如：今天 22:10
    class func getDescTime(date:Double,sysDate:Double)->String{
        var descTime:String = ""
        var hourTime:String = ""
        if date > 0 {
            let d1_time:Double = round(date * 1000)
            let d2_time:Double = round(sysDate * 1000)
            let days:Int = Int(daysBetween(smdate: d2_time,bdate: d1_time))
            hourTime = hourString(date: date)
            
            if days<0 {
                let daysAfter:Int = abs(days)
                if(daysAfter == 0){
                    descTime = "今天"
                }else{
                    return jieMinuteFullString(date: date)
                    //descTime="\(daysAfter)天后"
                }
                return "\(descTime) \(hourTime)"
            }
            
            
            if(days==0){
                descTime = "今天"
            }else if(days == 1){
                descTime = "昨天"
            }else if(days == 2){
                descTime = "前天"
            }else if(days > 2 && days < 7){
                descTime = "\(days)天前"
            }else if(days >= 7 && days <= 30){
                descTime = "一周前"
            }else if(days >= 30 && days <= 182){
                descTime = "一月前"
            }else if(days >= 182 && days <= 365){
                descTime = "半年前"
            }else if(days >= 365){
                descTime = "一年前"
            }else{
                return minuteFullString(date: date)
            }
            
            return "\(descTime) \(hourTime)"
            
        }else{
            return minuteFullString(date: date)
        }
        
    }
    
    //显示倒计时
    class func countDown(date:Double,ntimes:Double,timeOver:()->Void)->String{
        var teimsdescs:String=""
        if date>0{
            let d1_time:Double = date*Double(1000)
            let d2_teim:Double = ntimes*Double(1000)
            
            let diff:Int64 = Int64(round(d1_time-d2_teim))
            
            if diff>0{
                let day:Int64 = diff/(24*60*60*1000)
                let hour:Int64 = diff/(60*60*1000)-(day*24)
                
                let min:Int64 = ((diff / (60*1000))-(day*24*60)-(hour*60))
                
                let s:Int64 = diff / 1000 - (day*24*60*60)-(hour*60*60)-(min*60)
                
                teimsdescs = "\(day)天\(hour)时\(min)分\(s)秒"
            }else{
                timeOver()
            }
        }
        return teimsdescs
    }
    
    //时间差运算
    class func daysBetween(smdate:Double,bdate:Double)->Double{
        return (smdate/Double(86400000))-(bdate/Double(86400000))
    }
    
    /**
     * 判断两个时间之间的相差天数 (为正整数时间)
     * @param preTime
     * @param nowTime
     * @return
     */
    class func diffDay(preTime:Double,nowTime:Double)->Double{
        return abs((nowTime - preTime) / 1000 / 3600 / 24)
    }
    
    
    
}
