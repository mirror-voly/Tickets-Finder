//
//  ShowAllTicketsView.swift
//  Tickets Finder
//
//  Created by mix on 26.06.2024.
//

import SwiftUI

struct ShowAllTicketsView: View {
    
    @ObservedObject private var tikets = JSONShowAllTicketsReader()
    @EnvironmentObject private var global: GlobalState
    
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                HStack(content: {
                    VStack(spacing: 4, content: {
                        Button (action: {
                            global.correntState = .two
                        }, label: {
                            Image("i3")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .tint(Color(hex: 0x2261BC))
                        })
                    })
                        VStack(alignment: .leading, spacing: 4, content: {
                            Text("\(global.fromWhereString)-\(global.toWhereString)")
                                .font(Font.custom("SFProDisplay-Medium", size: 16))
                                .bold()
                            Text("\(global.flightDate, format: .dateTime.day()) \(global.flightDate, format: .dateTime.month()), 1 пассажир").textCase(.lowercase)
                                .foregroundStyle(Color(hex: 0x9F9F9F))
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                        })
                        .padding(.vertical, 8)
                   
                    Spacer()
                    
                })
                .background(Color(hex: 0x242529))
                .padding(.horizontal)
                .padding(.top)
                
                ScrollView {
                    VStack(spacing: 16, content: {
                        ForEach(tikets.tickets) { info in
                            TikcketItem(ticket: info)
                        }
                    })
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom, 50)
                }
                
                Spacer()
                
            })
            
            HStack {
                HStack(spacing: 16, content: {
                    
                    Button(action: {
                    }, label: {
                        Image("i2")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("Фильтр")
                            .foregroundStyle(.white)
                    })
                    
                    Button(action: {
                    }, label: {
                        Image("i7")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("Грфик цен")
                            .foregroundStyle(.white)
                    })
                    
                })
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .padding()
            }
            .background(Color(hex: 0x2261BC))
            .clipShape(.rect(cornerRadius: 50))
            .padding(.bottom, 20)
            
        })
        
    }
}

#Preview {
    ShowAllTicketsView()
}
