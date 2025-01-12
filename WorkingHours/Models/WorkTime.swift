//
//  WorkTime.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

class WorkTime: ObservableObject {

    @Published var start: Timestamp
    @Published var end: Timestamp?
    @Published var wage: Double?

    init(start: Timestamp, end: Timestamp? = nil, wage: Double? = nil) {
        self.start = start
        self.end = end
        self.wage = wage
    }

    var durationInSeconds: Int {
        if let end {
            return start.durationBetweenInSeconds(other: end)
        }else {
            let currentDate = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: currentDate)
            let minute = calendar.component(.minute, from: currentDate)
            let second = calendar.component(.second, from: currentDate)
            
            let now = Timestamp(hour: hour, minute: minute, second: second)
            return start.durationBetweenInSeconds(other: now)
        }
    }
    
    var duration: Duration {
        if let end {
            return start.durationBetween(other: end)
        }else {
            let currentDate = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: currentDate)
            let minute = calendar.component(.minute, from: currentDate)
            let second = calendar.component(.second, from: currentDate)
            
            let now = Timestamp(hour: hour, minute: minute, second: second)
            return start.durationBetween(other: now)
        }
    }

    var earnings: Double {
        guard let wage else { return 0 }
        let workedHours = Double(durationInSeconds) / 3600
        return workedHours * wage
    }

}
