//
//  AddWorkTimeView.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUI

struct AddWorkTimeView: View {
    @ObservedObject var workDayManager: WorkDayManager
    @Binding var isPresented: Bool

    @State var workTimeDate: Date = Date()
    @StateObject var workTimeStart: Timestamp = Timestamp()
    @StateObject var workTimeEnd: Timestamp = Timestamp()
    @State var workTimeHourlyRate: Double?

    var body: some View {
        VStack() {

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
                TextField(
                    "Enter hourly rate", value: $workTimeHourlyRate, format: .number
                )
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            }

            HStack {
                // Left-aligned Save button
                Button("Save") {
                    saveWorkTime()
                    withAnimation {
                        isPresented = false
                    }
                }
                .disabled(!workTimeEnd.isAfter(other: workTimeStart))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

                // Spacer to push Cancel to the right
                Spacer()

                // Right-aligned Cancel button
                Button(action: {
                    // Close the view early
                    withAnimation {
                        isPresented = false
                    }
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                        .padding()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }

        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }

    private func saveWorkTime() {
        workDayManager.addWorkTime(
            date: SimpleDate(workTimeDate),
            workTime:
                WorkTime(
                    start: workTimeStart, end: workTimeEnd, hourlyRate: workTimeHourlyRate))
    }
}
