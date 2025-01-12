//
//  WorkDay.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

struct WorkDay {
    var id: String
    
    var year: Int
    var month: Int
    var day: Int
    
    var workTimes: [WorkTime] = []

    init(date: Date) {
        let components = Calendar.current.dateComponents(
            [.year, .month, .day], from: date)
        
        self.year = components.year!
        self.month = components.month!
        self.day = components.day!
        
        id = "\(day)-\(month)-\(year)"
    }
    
    func getDateString() -> String {
        return "\(day).\(month).\(year)"
    }
    
    func getTotalWorkTime() -> TimeInterval {
        let workTimesSum = workTimes.reduce(0) { $0 + $1.duration }
        return workTimesSum
    }

}
