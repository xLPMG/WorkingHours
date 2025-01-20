//
//  WorkDaysOverview.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUI
import SwiftData

struct WorkDaysOverview: View {
    
    @State private var isAddWorkTimeViewPresented = false
    @StateObject private var workDayManager = WorkDayManager()
    
    var body: some View {
            NavigationView {
                VStack {
                    WorkDaysList(workDays: workDayManager.workDays)
                    
                    if isAddWorkTimeViewPresented {
                        AddWorkTimeView(workDayManager: workDayManager, isPresented: $isAddWorkTimeViewPresented)
                            .transition(.move(edge: .bottom)) // Optional animation when appearing/disappearing
                    }
                }
                .navigationTitle("Work Days")
                .navigationBarItems(trailing: Button(action: {
                    withAnimation {
                        isAddWorkTimeViewPresented.toggle() // Show or hide the AddWorkTimeView
                    }
                }) {
                    Image(systemName: "plus")
                        .font(.title)
                })
            }
        }
}

#Preview {
    WorkDaysOverview()
}
