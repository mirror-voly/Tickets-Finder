//
//  WhereToGoHintsView.swift
//  Tickets Finder
//
//  Created by mix on 19.6.24..
//

import SwiftUI

struct WhereToGoHintsView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State private var nextViewOpened = false
    
    private func openEmptyView() {
        self.nextViewOpened = true
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16, content: {
            WhereToGoItem(buttonImageName: "i22", buttonText: "Сложный маршрут", buttonBackgroundColor: Color(hex: 0x3A633B))
                .onTapGesture(perform: {
                    openEmptyView()
                    })
            WhereToGoItem(buttonImageName: "i34", buttonText: "Куда угоднo", buttonBackgroundColor: (Color(hex: 0x2261BC)))
                .onTapGesture(perform: {
                    coordinator.toWhereString = "Куда угодно"
                    coordinator.dismissSheet()
                    })
            WhereToGoItem(buttonImageName: "i21", buttonText: "Выходные", buttonBackgroundColor: (Color(hex: 0x00427D)))
                .onTapGesture(perform: {
                    openEmptyView()
                    })
            WhereToGoItem(buttonImageName: "i15", buttonText: "Горячие билеты", buttonBackgroundColor: Color(hex: 0xFF5E5E))
                .onTapGesture(perform: {
                    openEmptyView()
                    })
        })
        .padding(.horizontal)
        .sheet(isPresented: $nextViewOpened, content: {
            EmptyView()
        })
        
        VStack {
            VStack(alignment: .leading, content: {
                SearchExampleItem(imageName: "D1", cityName: "Стамбул")
                SearchExampleItem(imageName: "D2", cityName: "Сочи")
                SearchExampleItem(imageName: "D3", cityName: "Пхукет")
            })
            .padding()
            .background(Color(hex: 0x2F3035))
            .clipShape(.rect(cornerRadius: 16))
        }
        .padding()
        
    }
}


#Preview {
    WhereToGoHintsView()
}
