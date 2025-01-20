//
//  WorkDaysRow.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUI

struct WorkDaysRow: View {
    
    @ObservedObject var workDay: WorkDay
    
    var body: some View {
        
        HStack {
            Text("\(workDay.getDateString())")
            
            Spacer()
            
            VStack {
                if workDay.earnings > 0 {
                    Text(String(format: "%.2f€", workDay.earnings))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.body)
                }
                
                Text(workDay.getTotalWorkTime().formatted(.units(width: .narrow)))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    WorkDaysRow(workDay: WorkDay(date: Date()))
}
