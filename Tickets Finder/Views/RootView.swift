//
//  RootView.swift
//  Tickets Finder
//
//  Created by mix on 15.6.24..
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    private let dataManager = DataManager()
    
    var body: some View {

        
        TabView(selection: .constant(0),
                content: {
            if coordinator.currentPage == .one {
                coordinator.build(page: .one).tabItem {
                    Image("i20").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    Text("Авиабилеты")
                        .font(Font.custom("SFProDisplay-Regular", size: 10))
                }
            } else if coordinator.currentPage == .two {
                coordinator.build(page: .two).tabItem {
                    Image("i20").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    Text("Авиабилеты")
                        .font(Font.custom("SFProDisplay-Regular", size: 10))
                }
            } else if coordinator.currentPage == .three {
                coordinator.build(page: .three).tabItem {
                    Image("i20").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    Text("Авиабилеты")
                        .font(Font.custom("SFProDisplay-Regular", size: 10))
                }
            }
            
            EmptyView().tabItem {
                Image("i9").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                Text("Отели")
                    .font(Font.custom("SFProDisplay-Regular", size: 10))
            }
            EmptyView().tabItem {
                Image("i8").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                Text("Короче")
                    .font(Font.custom("SFProDisplay-Regular", size: 10))
            }
            EmptyView().tabItem {
                Image("i25").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                Text("Подписки")
                    .font(Font.custom("SFProDisplay-Regular", size: 10))
            }
            EmptyView().tabItem {
                Image("i27").renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                Text("Профиль")
                    .font(Font.custom("SFProDisplay-Regular", size: 10))
            }
        }).onAppear() {
            if let names = dataManager.loadData() {
                coordinator.fromWhereString = names[0]
                coordinator.toWhereString = names[1]
            
            }
        }
    }
}

#Preview {
    RootView()
}
