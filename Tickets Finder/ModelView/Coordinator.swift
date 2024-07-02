//
//  Coordinator.swift
//  Tickets Finder
//
//  Created by mix on 27.06.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    let dataMeneger = DataManager()
    
    enum Page {
        case one, two, three
    }
    
    @Published var modalWindowIsOpened = false
    
    @Published var fromWhereString = ""
    @Published var toWhereString = ""
    
    @Published var flightDate = Date()
    @Published var flightBackDate = Date()
    
    @Published var currentPage = Page.one
    
    func setLoadedData() {
        guard let loadedData = dataMeneger.loadData() else { return }
        fromWhereString = loadedData[0]
        toWhereString = loadedData[1]
    }
    
    func changePage( page: Page) {
        self.currentPage = page
    }
    
    func openSheet() {
        self.modalWindowIsOpened = true
    }
    
    func dismissSheet() {
        self.modalWindowIsOpened = false
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .one:
            StartView()
        case .two:
            SearchStartedView()
        case .three:
            ShowAllTicketsView()
        }
    }
    
    init() {
        setLoadedData()
    }
    
}
