//
//  Coordinator.swift
//  Tickets Finder
//
//  Created by mix on 27.06.2024.
//

import Foundation

class Coordinator: ObservableObject {
    
    enum Page {
        case one, two, three
    }

    @Published var showPage = Page.one
    @Published var modalWindowIsOpened = false
    
    @Published var fromWhereString = ""
    @Published var toWhereString = ""
    
    @Published var flightDate = Date()
    @Published var flightBackDate = Date()
}
