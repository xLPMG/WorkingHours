//
//  DateExtension.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

extension Date {
    /// Returns the year component of the date
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    /// Returns the month component of the date
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    /// Returns the day component of the date
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
}
