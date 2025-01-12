//
//  WorkDaysListView.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUICore
import SwiftUI

struct WorkDaysList: View {
 
    var workDays: [WorkDay]
    
    var body: some View {
        
        List {
            ForEach(workDays, id: \.id) { workDay in
                WorkDaysRow(workDay: workDay)
            }
        }
    }
    
}

#Preview {
    WorkDaysList(workDays: [WorkDay(date: Date()), WorkDay(date: Date(timeInterval: 200000.0, since: Date()))  ])
}
