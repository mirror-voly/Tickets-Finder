//
//  Calculate.swift
//  Tickets Finder
//
//  Created by mix on 28.06.2024.
//

import Foundation

class Calculate {
    
    func takeDateFromStrind(_ stringDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = dateFormatter.date(from: stringDate) else { return nil }
        return date
    }
    
    func getTimeInterval(departureDate: Date?, arrarrivalDate: Date?) -> String? {
        if departureDate != nil && arrarrivalDate != nil {
            let hours = (arrarrivalDate!.timeIntervalSince(departureDate!)/3600)
            let hoursRounded = round(hours*10)/10
            return String(hoursRounded)
        } else {
            return nil
        }
    }

    func formatThePrice(_ value: Int) -> String {
        let convertToString = value.formatted(.number)
        let formatedStringPrice = convertToString.replacingOccurrences(of: ".", with: " ")
        return formatedStringPrice
    }
}
