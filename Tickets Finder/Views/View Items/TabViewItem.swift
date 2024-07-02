//
//  TabViewItem.swift
//  Tickets Finder
//
//  Created by mix on 02.07.2024.
//

import SwiftUI

struct TabViewItem: View {
    
    let tabViewImageName: String
    let tabViewText: String
    
    var body: some View {
        Image(tabViewImageName).renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
        Text(tabViewText)
            .font(Font.custom("SFProDisplay-Regular", size: 10))
    }
    
}

