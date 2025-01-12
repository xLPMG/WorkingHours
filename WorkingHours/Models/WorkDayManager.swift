//
//  WorkDayManager.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import Foundation
import SwiftUI

class WorkDayManager: ObservableObject {
    
    @Published var workDays : [WorkDay] = []
    
    init() {}
    
    func addWorkTime(date: SimpleDate, workTime: WorkTime) {
        let workDay: WorkDay? = workDays.first(where: { $0.date.isSameDateAs(date) })
        if workDay != nil {
            workDay!.workTimes.append(workTime)
        } else {
            let newWorkDay = WorkDay(date: date)
            newWorkDay.workTimes.append(workTime)
            workDays.append(newWorkDay)
        }
    }
    
}
