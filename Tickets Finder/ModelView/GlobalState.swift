//
//  GlobalState.swift
//  Tickets Finder
//
//  Created by mix on 27.06.2024.
//

import Foundation

class GlobalState: ObservableObject {
    
    enum FirstScreenState {
        case one
        case two
        case three
    }

    @Published var correntState = FirstScreenState.one
    @Published var modalWindowIsOpened = false
    
    @Published var fromWhereString = ""
    @Published var toWhereString = ""
    
    @Published var flightDate = Date()
    @Published var flightBackDate = Date()
}
