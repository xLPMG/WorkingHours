//
//  Item.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 10.01.25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
