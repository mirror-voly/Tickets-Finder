//
//  DirectFlightItem.swift
//  Tickets Finder
//
//  Created by mix on 26.06.2024.
//

import SwiftUI

struct DirectFlightItem: View {
    
    let ticket: TicketsOffer
    let calculate = Calculate()
    
    var body: some View {
        let circleColor: Color = {
            switch ticket.id {
            case 1: return .red
            case 10: return .blue
            case 30: return .white
            default:
                print("default case")
                return .black
            }
        }()
        
        let price = calculate.formatThePrice(ticket.price.value)
        
        HStack(alignment: .top, content: {
            Circle()
                .colorMultiply(circleColor)
                .frame(width: 24, height: 24)
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(content: {
                   
                    Text(ticket.title)
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                        .italic()
                        .lineLimit(1)
                    Spacer()
                    HStack {
                        Text("\(price) ₽")
                            .multilineTextAlignment(.trailing)
                            .font(Font.custom("SFProDisplay-Regular", size: 14))
                            .italic()
                        Image("i14")
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .resizable()
                            .frame(width: 9, height: 16)
                    }
                    .padding(.trailing)
                    .foregroundStyle(.blue)
                    
                })
                
                
                Text(ticket.timeRange.joined(separator: " "))
                    .font(Font.custom("SFProDisplay-Semibold", size: 14))
                    .padding(.trailing)
                    .lineLimit(1)
            })
            
            
        })
        Divider()
        
    }
}

#Preview {
    DirectFlightItem(ticket: TicketsOffer(id: 1, title: "lol", timeRange: ["05:55", "05:55", "05:55", "05:55", "05:55", "05:55", "05:55", "05:55", "05:55"], price: Price(value: 4234)))
}
