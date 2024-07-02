//
//  MusicOfferItem.swift
//  Tickets Finder
//
//  Created by mix on 14.6.24..
//

import SwiftUI

struct MusicOfferItem: View {
    
    let offerInfo: Offer
    private let calculate = Calculate()
    
    var body: some View {
        
        let price = calculate.formatThePrice(offerInfo.price.value)
        VStack(alignment: .leading, spacing: 8, content: {
            Image("\(offerInfo.id)")
                .resizable()
                .frame(width: 133, height: 133)
                .clipShape(RoundedRectangle(cornerRadius: 18))
            Text(offerInfo.title)
                .font(.title3)
                .font(Font.custom("SFProDisplay-Medium", size: 16))
            Text(offerInfo.town)
                    .lineLimit(1)
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
            Label("от " + price + " ₽", image: "i20")
                .font(Font.custom("SFProDisplay-Semibold", size: 14))
        })
        
    }
}

#Preview {
    MusicOfferItem(offerInfo: Offer.init(id: 1, title: "fsdf", town: "fsfs0", price: Price(value: 34234)))
}
