//
//  DatePopoverView.swift
//  Tickets Finder
//
//  Created by mix on 24.06.2024.
//

import SwiftUI

struct DatePopoverView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @Binding var datePickerPresented: Bool
    var datePickerIsOnFlightDate: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            if datePickerIsOnFlightDate {
                VStack {
                    DatePicker("", selection: $coordinator.flightDate, in: Date()..., displayedComponents: .date)
                        .onChange(of: coordinator.flightDate) {
                            
                            if coordinator.flightDate > coordinator.flightBackDate {
                                coordinator.flightBackDate = coordinator.flightDate
                            }
                            datePickerPresented = false
                        }
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                }
            } else {
                VStack {
                    DatePicker("", selection: $coordinator.flightBackDate, in: coordinator.flightDate..., displayedComponents: .date)
                        .onChange(of: coordinator.flightBackDate) {
                            datePickerPresented = false
                        }
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                }
            }
            
            
            
        }.background(Color.clear)
        
        
    }
}


#Preview {
    DatePopoverView(datePickerPresented: .constant(false), datePickerIsOnFlightDate: true)
}
