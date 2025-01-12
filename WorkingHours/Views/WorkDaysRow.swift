//
//  WorkDaysRow.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUI
import SwiftData

struct WorkDaysRow: View {
    
    @State var workDay: WorkDay
    
    var body: some View {
        
        HStack {
            Text("\(workDay.getDateString())")
            
            Spacer()
            
            let formatter = DateComponentsFormatter()
            Text("\(formatter.string(from: workDay.getTotalWorkTime())!)")
        }
    }
}

#Preview {
    WorkDaysRow(workDay: WorkDay(date: Date()))
}
