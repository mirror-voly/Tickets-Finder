//
//  Tickets_FinderApp.swift
//  Tickets Finder
//
//  Created by mix on 13.6.24..
//

import SwiftUI

@main

struct Tickets_FinderApp: App {
    
    @StateObject private var global = GlobalState()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(global)
        }
    }
}
