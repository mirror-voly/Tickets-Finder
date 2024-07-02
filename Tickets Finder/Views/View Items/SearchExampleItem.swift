//
//  SearchExampleItem.swift
//  Tickets Finder
//
//  Created by mix on 28.06.2024.
//

import SwiftUI

struct SearchExampleItem: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    let imageName: String
    let cityName: String
    
    var body: some View {
        HStack(spacing: 8, content: {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 4, content: {
                Text(cityName)
                    .font(Font.custom("SFProDisplay-Medium", size: 16))
                Text("Популярное направление")
                    .foregroundColor(Color(hex: 0x5E5F61))
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
            })
            Spacer()
        }).frame(width: 296, height: 56)
            .onTapGesture {
                coordinator.toWhereString = cityName
                coordinator.modalWindowIsOpened = false
            }
        
        Divider()
    }
}

//#Preview {
//    SearchExampleItem()
//}
