//
//  RootView.swift
//  Tickets Finder
//
//  Created by mix on 15.6.24..
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {

        let emptyView = coordinator.build(page: .zero)
        
        TabView(selection: .constant(0),
                content: {
            if coordinator.currentPage == .one {
                coordinator.build(page: .one).tabItem {
                    TabViewItem(tabViewImageName: "i20", tabViewText: "Авиабилеты")
                }
            } else if coordinator.currentPage == .two {
                coordinator.build(page: .two).tabItem {
                    TabViewItem(tabViewImageName: "i20", tabViewText: "Авиабилеты")
                }
            } else if coordinator.currentPage == .three {
                coordinator.build(page: .three).tabItem {
                    TabViewItem(tabViewImageName: "i20", tabViewText: "Авиабилеты")
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
        
    }
}

#Preview {
    RootView()
}
