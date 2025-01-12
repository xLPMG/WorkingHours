//
//  Day.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

class SimpleDate {
    
    let day: Int
    let month: Int
    let year: Int
    
    init (day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }
    
    convenience init(_ date: Date) {
        let components = Calendar.current.dateComponents(
            [.year, .month, .day], from: date)
        
        self.init(day: components.day!, month: components.month!, year: components.year!)
    }
    
    func isSameDateAs(_ other: SimpleDate) -> Bool {
        day == other.day && month == other.month && year == other.year
    }
    
    func isBefore(_ other: SimpleDate) -> Bool {
        year < other.year || (year == other.year && month < other.month) || (year == other.year && month == other.month && day < other.day)
    }
    
    func isAfter(_ other: SimpleDate) -> Bool {
        return !isBefore(other) && !isSameDateAs(other)
    }
}
