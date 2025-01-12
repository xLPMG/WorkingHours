//
//  Timestamp.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

class Timestamp: ObservableObject {
    var hour: Int
    var minute: Int
    var second: Int
    let totalSeconds: Int

    init(hour: Int = 0, minute: Int = 0, second: Int = 0) {

        if hour < 0 || hour > 23 {
            fatalError("Invalid hour value \(hour)")
        }

        if minute < 0 || minute > 59 {
            fatalError("Invalid minute value \(minute)")
        }

        if second < 0 || second > 59 {
            fatalError("Invalid second value \(second)")
        }

        self.hour = hour
        self.minute = minute
        self.second = second
        self.totalSeconds = (hour * 3600) + (minute * 60) + second
    }

    init(totalSeconds: Int) {

        if totalSeconds < 0 {
            fatalError("Invalid total seconds value \(totalSeconds)")
        }

        self.totalSeconds = totalSeconds
        self.hour = totalSeconds / 3600
        self.minute = (totalSeconds / 60) % 60
        self.second = totalSeconds % 60
    }

    func isSame(other: Timestamp) -> Bool {
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

    func add(duration: Duration) -> Timestamp {
        //TODO: Int & Int64
        return Timestamp(
            totalSeconds: totalSeconds + Int(duration.components.seconds))
    }

    func add(hours: Int = 0, minutes: Int = 0, seconds: Int) -> Timestamp {
        return Timestamp(
            hour: self.hour + hours, minute: self.minute + minutes,
            second: self.second + seconds)
    }
}
