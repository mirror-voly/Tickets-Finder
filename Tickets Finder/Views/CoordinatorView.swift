//
//  CoordinatorView.swift
//  Tickets Finder
//
//  Created by mix on 02.07.2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    private let dataManager = DataManager()
    
    var body: some View {
        
        let emptyView = EmptyView()
        let firstTabViewItem: TabViewItem = {
            return TabViewItem(tabViewImageName: "i20", tabViewText: "Авиабилеты")
        }()
        
        TabView(selection: .constant(0),
                content: {
            switch coordinator.currentPage {
            case .one:
                coordinator.build(page: .one).tabItem {
                    firstTabViewItem
                }
            case .two: 
                coordinator.build(page: .two).tabItem {
                firstTabViewItem
            }
            case .three:
                coordinator.build(page: .three).tabItem {
                firstTabViewItem
            }
            }

            emptyView.tabItem {
                TabViewItem(tabViewImageName: "i9", tabViewText: "Отели")
            }
            emptyView.tabItem {
                TabViewItem(tabViewImageName: "i8", tabViewText: "Короче")
            }
            emptyView.tabItem {
                TabViewItem(tabViewImageName: "i25", tabViewText: "Подписки")
            }
            emptyView.tabItem {
                TabViewItem(tabViewImageName: "i27", tabViewText: "Профиль")
            }
            
        })
        .environmentObject(coordinator)
        .onAppear() {
            if let names = dataManager.loadData() {
                coordinator.fromWhereString = names[0]
                coordinator.toWhereString = names[1]
            }
        }
        

    }
}

#Preview {
    CoordinatorView()
}
