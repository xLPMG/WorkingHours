//
//  WorkDaysOverview.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUI
import SwiftData

struct WorkDaysOverview: View {
    
    @StateObject private var workDayManager = WorkDayManager()
    
    var body: some View {
        
        AddWorkTimeView(workDayManager: workDayManager)
        
        WorkDaysList(workDays: workDayManager.workDays)
    }
}

#Preview {
    WorkDaysOverview()
}
