//
//  Timestamp+Comparison.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 20.01.25.
//

extension Timestamp {
    func isEqualTo(other: Timestamp) -> Bool {
        return totalSeconds == other.totalSeconds
    }

    func isBefore(other: Timestamp) -> Bool {
        return totalSeconds < other.totalSeconds
    }

    func isAfter(other: Timestamp) -> Bool {
        return totalSeconds > other.totalSeconds
    }
    
    func durationBetween(other: Timestamp) -> Duration {
        if isBefore(other: other) {
            return Duration.seconds(other.totalSeconds - totalSeconds)
        } else {
            return Duration.seconds(totalSeconds - other.totalSeconds)
        }
    }

    func durationBetweenInSeconds(other: Timestamp) -> Int {
        if isBefore(other: other) {
            return other.totalSeconds - totalSeconds
        } else {
            return totalSeconds - other.totalSeconds
        }
    }
}
