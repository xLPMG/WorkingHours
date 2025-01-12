//
//  AddWorkTimeView.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUI

struct AddWorkTimeView: View {
    @ObservedObject var workDayManager: WorkDayManager

    @State var workTimeDate: Date = Date()
    @StateObject var workTimeStart: Timestamp = Timestamp()
    @StateObject var workTimeEnd: Timestamp = Timestamp()
    @State var workTimeWage: Double?

    var body: some View {
        VStack(spacing: 20) {
            DatePicker(
                "Select a date", selection: $workTimeDate,
                displayedComponents: .date
            )
            .datePickerStyle(GraphicalDatePickerStyle())

            Text("Start Time")
            TimePickerView(timestamp: workTimeStart)

            Text("End Time")
            TimePickerView(timestamp: workTimeEnd)

            // Wage Input
            HStack {
                Text("Wage:")
                TextField("Enter Hourly Wage", value: $workTimeWage, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
            }
            
            Button("Save") { saveWorkTime() }.disabled(
                !workTimeEnd.isAfter(other: workTimeStart))

        }
        .padding()
    }

    private func saveWorkTime() {
        workDayManager.addWorkTime(
            date: SimpleDate(workTimeDate),
            workTime:
                WorkTime(
                    start: workTimeStart, end: workTimeEnd, wage: workTimeWage))
    }
}
