//
//  Coordinator.swift
//  Tickets Finder
//
//  Created by mix on 27.06.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    enum Page {
        case zero, one, two, three
    }

    @Published var modalWindowIsOpened = false
    
    @Published var fromWhereString = ""
    @Published var toWhereString = ""
    
    @Published var flightDate = Date()
    @Published var flightBackDate = Date()
    
    @Published var currentPage = Page.one
    
    func changePage( page: Page) {
        self.currentPage = page
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .zero:
            EmptyView()
        case .one:
            StartView()
        case .two:
            SearchStartedView()
        case .three:
            ShowAllTicketsView()
        }
    }
}
