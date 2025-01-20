//
//  Timestamp+Equatable.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 20.01.25.
//

extension Timestamp: Equatable {
    static func == (lhs: Timestamp, rhs: Timestamp) -> Bool {
        return lhs.isEqualTo(other: rhs)
    }

    static func < (lhs: Timestamp, rhs: Timestamp) -> Bool {
        return lhs.isBefore(other: rhs)
    }

    static func > (lhs: Timestamp, rhs: Timestamp) -> Bool {
        return lhs.isAfter(other: rhs)
    }
}
