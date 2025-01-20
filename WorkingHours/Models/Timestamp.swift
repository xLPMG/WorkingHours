//
//  Timestamp.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation

class Timestamp: ObservableObject, CustomStringConvertible {
    @Published var hours: Int {
        didSet {
            if hours < 0 || hours > 23 {
                fatalError("Invalid hours value \(hours)")
            }
        }
    }
    @Published var minutes: Int {
        didSet {
            if minutes < 0 || minutes > 59 {
                fatalError("Invalid minutes value \(minutes)")
            }
        }
    }
    @Published var seconds: Int {
        didSet {
            if seconds < 0 || seconds > 59 {
                fatalError("Invalid seconds value \(seconds)")
            }
        }
    }

    var totalSeconds: Int {
        return (hours * 3600) + (minutes * 60) + seconds
    }

    init(hours: Int = 0, minutes: Int = 0, seconds: Int = 0) {
        if hours < 0 || hours > 23 {
            fatalError("Invalid hours value \(hours)")
        }
        if minutes < 0 || minutes > 59 {
            fatalError("Invalid minutes value \(minutes)")
        }
        if seconds < 0 || seconds > 59 {
            fatalError("Invalid seconds value \(seconds)")
        }

        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }

    init(totalSeconds: Int) {
        if totalSeconds < 0 {
            fatalError("Invalid total seconds value \(totalSeconds)")
        }

        self.hours = totalSeconds / 3600
        self.minutes = (totalSeconds / 60) % 60
        self.seconds = totalSeconds % 60
    }
    
    var description: String {
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
