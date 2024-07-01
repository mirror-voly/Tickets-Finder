//
//  DatePopoverView.swift
//  Tickets Finder
//
//  Created by mix on 24.06.2024.
//

import SwiftUI

struct DatePopoverView: View {
    
    @EnvironmentObject private var global: GlobalState
    @Binding var datePickerPresented: Bool
    var datePickerIsOnFlightDate: Bool
    
    var body: some View {
        
        GeometryReader { geo in
            if datePickerIsOnFlightDate {
                VStack {
                    DatePicker("", selection: $global.flightDate, in: Date()..., displayedComponents: .date)
                        .onChange(of: global.flightDate) {
                            
                            if global.flightDate > global.flightBackDate {
                                global.flightBackDate = global.flightDate
                            }
                            datePickerPresented = false
                        }
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                }
            } else {
                VStack {
                    DatePicker("", selection: $global.flightBackDate, in: global.flightDate..., displayedComponents: .date)
                        .onChange(of: global.flightBackDate) {
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
