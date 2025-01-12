//
//  WorkTime.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

struct WorkTime {

    var start: Date
    var end: Date?
    var wage: Double?

    init(start: Date, end: Date? = nil, wage: Double? = nil) {
        self.start = start
        self.end = end
        self.wage = wage
    }

    var duration: TimeInterval {
        let endDate = end ?? Date()
        return endDate.timeIntervalSince(start)

    }

    var earmnings: Double {
        guard let wage else { return 0 }
        return duration * wage
    }

}
