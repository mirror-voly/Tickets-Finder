//
//  WhereToGoItem.swift
//  Tickets Finder
//
//  Created by mix on 19.6.24..
//

import SwiftUI

struct WhereToGoItem: View {
    
    let buttonImageName: String
    let buttonText: String
    let buttonBackgroundColor: Color
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8, content: {
                Image(buttonImageName)
            .frame(minWidth: 48, minHeight: 48)
            .background(buttonBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            Text(buttonText)
                .multilineTextAlignment(.center)
                .font(Font.custom("SFProDisplay-Semibold", size: 14))
                .frame(width: 75)
        })
        
    }
}



#Preview {
    WhereToGoItem(buttonImageName: "i22", buttonText: "Куда угодно", buttonBackgroundColor: .green)
}
