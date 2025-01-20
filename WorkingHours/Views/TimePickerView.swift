//
//  TimePickerView.swift
//  WorkingHours
//
//  Created by Luca-Philipp Grumbach on 12.01.25.
//

import SwiftUICore
import SwiftUI

struct TimePickerView: View {
    @ObservedObject var timestamp: Timestamp

    var body: some View {
        HStack {
            Picker("Hours", selection: $timestamp.hours) {
                ForEach(0..<24, id: \.self) { hour in
                    Text("\(hour)").tag(hour)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80, height: 50) // Adjust height if necessary
            .clipped()
            
            Text(":")
            
            Picker("Minutes", selection: $timestamp.minutes) {
                ForEach(0..<60, id: \.self) { minute in
                    Text("\(minute)").tag(minute)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80, height: 50)
            .clipped()
            
            Text(":")
            
            Picker("Seconds", selection: $timestamp.seconds) {
                ForEach(0..<60, id: \.self) { second in
                    Text("\(second)").tag(second)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80, height: 50)
            .clipped()
        }
        .padding()
    }
}

#Preview {
    TimePickerView(timestamp: Timestamp())
}
