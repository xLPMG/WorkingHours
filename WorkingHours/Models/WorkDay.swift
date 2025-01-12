//
//  WorkDay.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation
import SwiftUICore

class WorkDay {
    var id: String
    
    @Published var date: SimpleDate
    
    @Published var workTimes: [WorkTime] = []
    
    init (date: SimpleDate) {
        self.date = date
        id = "\(date.day)-\(date.month)-\(date.year)"
    }

    convenience init(date: Date) {
        let components = Calendar.current.dateComponents(
            [.year, .month, .day], from: date)
        
        self.init(date: SimpleDate(day: components.day!, month: components.month!, year: components.year!))
    }
    
    func getDateString() -> String {
        return "\(date.day).\(date.month).\(date.year)"
    }
    
    func getTotalWorkTimeInSeconds() -> Int {
        return workTimes.reduce(0) { $0 + $1.durationInSeconds }
    }
    
    func getTotalWorkTime() -> Duration {
        return Duration.seconds(getTotalWorkTimeInSeconds())
    }

}
