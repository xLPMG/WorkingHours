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
            
            Text("\(workDay.getTotalWorkTime().formatted(.units(width: .narrow)))")
        }
    }
}

#Preview {
    WorkDaysRow(workDay: WorkDay(date: Date()))
}
