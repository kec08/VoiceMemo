//
//  Date+Extensions.swift
//  voiceMemo
//

import Foundation

extension Date {
    var formattedTime: String {
        let formetter = DateFormatter()
        formetter.locale = Locale(identifier: "ko_KR")
        formetter.dateFormat = "a hh:mm"
        return formetter.string(from: self)
    }
    
    var formattedDay: String {
        let now = Date()
        let celendar = Calendar.current
        
        let nowStartOffDay = celendar.startOfDay(for: now)
        let dateStartOfDay = celendar.startOfDay(for: self)
        let numOfDaysDifference = celendar.dateComponents([.day], from: dateStartOfDay, to: nowStartOffDay).day!
        
        if numOfDaysDifference == 0 {
            return "오늘"
        } else {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR")
            formatter.dateFormat = "M월 d일 E요일"
            return formatter.string(from: self)
        }
    }
}
