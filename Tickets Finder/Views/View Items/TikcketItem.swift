//
//  TikcketItem.swift
//  Tickets Finder
//
//  Created by mix on 26.06.2024.
//

import SwiftUI


struct TikcketItem: View {
    
    let ticket: Ticket
    private let calculate = Calculate()
    
    var body: some View {
        
        let departureDate: Date? = calculate.takeDateFromStrind(ticket.departure.date)
        let arrarrivalDate: Date? = calculate.takeDateFromStrind(ticket.arrival.date)
        let interval: String? = calculate.getTimeInterval(departureDate: departureDate, arrarrivalDate: arrarrivalDate)
        let price = calculate.formatThePrice(ticket.price.value)
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
        VStack(alignment: .leading, content: {
                
                
                VStack(alignment: .leading, content: {
                    HStack {
                        Text("\(price) ₽")
                            .font(Font.custom("SFProDisplay-Semibold", size: 22))
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    
                    HStack(content: {
                        HStack(alignment: .center, content: {
                            Circle()
                                .colorMultiply(Color(hex: 0xFF5E5E))
                                .frame(width: 24, height: 24)
                            
                            HStack(alignment: .top, spacing: 10, content: {
                                
                                HStack(spacing: 2, content: {
                                    VStack(alignment: .leading, content: {
                                        Text(departureDate!, format: .dateTime.hour() .minute())
                                        Text(ticket.departure.airport.rawValue)
                                            .foregroundStyle(Color(hex: 0x9F9F9F))
                                    })
                                    
                                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                                        Rectangle()
                                            .frame(width: 10, height: 2)
                                            .foregroundStyle(Color(hex: 0x9F9F9F))
                                        Spacer()
                                            .frame(height: 15)
                                        
                                    })
                                    
                                    
                                    VStack(alignment: .leading, content: {
                                        Text(arrarrivalDate!, format: .dateTime.hour() .minute())
                                        Text(ticket.arrival.airport.rawValue)
                                            .foregroundStyle(Color(hex: 0x9F9F9F))
                                    })
                                })
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                                .italic()
                                
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 2, content: {
                                    
                                    Text("\(interval ?? "- ")ч в пути")
                                    if !ticket.hasTransfer {
                                        Text("/")
                                            .foregroundStyle(Color(hex: 0x9F9F9F))
                                        Text("Без пересадок")
                                    }
                                })
                                .font(Font.custom("SFProDisplay-Semibold", size: 14))
                                .minimumScaleFactor(0.8)
                                .padding(.leading)
                                
                            })
                        })
                    })
                })
                .padding()
                .background(Color(hex: 0x1D1E20))
                .clipShape(.rect(cornerRadius: 8))
            })
            
            if ticket.badge != nil {
                VStack {
                    Text(ticket.badge!)
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                        .italic()
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                        .background(Color(hex: 0x2261BC))
                        .clipShape(.rect(cornerRadius: 50))
                }.padding(.top, -8)
            }
            
        })
       
    }
}

#Preview {
    TikcketItem(ticket: Ticket(id: 2, badge: "Прилетает сегодня", price: Price(value: 3432), providerName: "03:22", company: "sdfs", departure: Arrival(town: Town.москва, date: "2024-02-23T17:20:00", airport: Airport.aer), arrival: Arrival(town: Town.москва, date: "2024-02-24T18:40:00", airport: Airport.aer), hasTransfer: true, hasVisaTransfer: true, luggage: Luggage(hasLuggage: true, price: nil), handLuggage: HandLuggage(hasHandLuggage: true, size: "sdewq"), isReturnable: true, isExchangable: true))
}
