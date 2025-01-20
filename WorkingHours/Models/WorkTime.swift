//
//  WorkTime.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

class WorkTime: ObservableObject, CustomStringConvertible {

    @Published var start: Timestamp
    @Published var end: Timestamp?
    @Published var hourlyRate: Double?

    init(start: Timestamp, end: Timestamp? = nil, hourlyRate: Double? = nil) {
        self.start = start
        self.end = end
        self.hourlyRate = hourlyRate
    }

    var durationInSeconds: Int {
        if let end {
            return start.durationBetweenInSeconds(other: end)
        }else {
            let currentDate = Date()
            let calendar = Calendar.current
            let hours = calendar.component(.hour, from: currentDate)
            let minutes = calendar.component(.minute, from: currentDate)
            let seconds = calendar.component(.second, from: currentDate)
            
            let now = Timestamp(hours: hours, minutes: minutes, seconds: seconds)
            return start.durationBetweenInSeconds(other: now)
        }
    }
    
    var duration: Duration {
        if let end {
            return start.durationBetween(other: end)
        }else {
            let currentDate = Date()
            let calendar = Calendar.current
            let hours = calendar.component(.hour, from: currentDate)
            let minutes = calendar.component(.minute, from: currentDate)
            let seconds = calendar.component(.second, from: currentDate)
            
            let now = Timestamp(hours: hours, minutes: minutes, seconds: seconds)
            return start.durationBetween(other: now)
        }
    }
    
    var earnings: Double {
        print("Computing earnings for WorkTime")
        guard let hourlyRate else { return 0 }
        let workedHours = Double(durationInSeconds) / 3600
        return workedHours * hourlyRate
    }
    
    var description: String {
        return "WorkTime(start: \(start), end: \(end ?? Timestamp(hours:0,minutes:0,seconds:0)), duration: \(duration), earnings: \(earnings)"
    }

}
