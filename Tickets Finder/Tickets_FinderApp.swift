//
//  Tickets_FinderApp.swift
//  Tickets Finder
//
//  Created by mix on 13.6.24..
//

import SwiftUI

@main

struct Tickets_FinderApp: App {
    
    @StateObject private var coordinator = Coordinator()
    private let dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(coordinator)
                .onAppear() {
                    if let names = dataManager.loadData() {
                        coordinator.fromWhereString = names[0]
                        coordinator.toWhereString = names[1]
                        
                    }
                }
        }
    }
}
