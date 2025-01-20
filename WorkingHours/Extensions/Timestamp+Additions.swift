//
//  Timestamp+Additions.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 20.01.25.
//

extension Timestamp {
    
    func add(duration: Duration) -> Timestamp {
        return Timestamp(
            totalSeconds: totalSeconds + Int(duration.components.seconds))
    }

    func add(hours: Int = 0, minutes: Int = 0, seconds: Int) -> Timestamp {
        return Timestamp(
            hours: self.hours + hours, minutes: self.minutes + minutes,
            seconds: self.seconds + seconds)
    }
}
