//
//  ContentView.swift
//  Tickets Finder
//
//  Created by mix on 13.6.24..
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject private var colabOffers = JSONColabOffersReader()
    @FocusState private var focusedField: Field?
    private let dataManager = DataManager()
    
    private enum Field: Int, Hashable {
        case fromWhereTextField
        case toWhereTextField
    }
    
    private func editingIsDone() {
        dataManager.saveData(fromWhereString: coordinator.fromWhereString, toWhereString: coordinator.toWhereString)
        focusedField = nil
    }
    
    private func tryToStartSearch() {
        if coordinator.fromWhereString != "" && coordinator.toWhereString != "" {
            coordinator.changePage(page: .two)
        }
    }
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            VStack {
                
                VStack(alignment: .center, content: {
                    Text("Поиск дешевых авиабилетов")
                        .frame(width: 182, height: 62)
                        .font(Font.custom("SFProDisplay-Semibold", size: 22))
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                })
                
                VStack {
                    HStack(content: {
                        Image("i26").padding(.leading)
                        VStack(content: {
                            TextField("Откуда - Москва", text: $coordinator.fromWhereString)
                                .onChange(of: coordinator.fromWhereString, { oldValue, newValue in
                                    if !newValue.isEmpty {
                                        let filteredText = newValue.filter { $0.isCyrillic }
                                        if filteredText != newValue {
                                            coordinator.fromWhereString = filteredText
                                        }
                                    }
                                })
                                .onSubmit {
                                    editingIsDone()
                                    if coordinator.fromWhereString != "" && coordinator.toWhereString == "" {
                                        self.coordinator.openSheet()
                                    }
                                    tryToStartSearch()
                                }
                                .focused($focusedField, equals: .fromWhereTextField)
                            
                            Divider()
                            
                            TextField("Куда - Турция", text:  $coordinator.toWhereString)
                                .onTapGesture {
                                    self.coordinator.openSheet()
                                    tryToStartSearch()
                                }
                                .focused($focusedField, equals: .toWhereTextField)
                            
                        })
                        .font(Font.custom("SFProDisplay-Regular", size: 16))
                        .padding()
                    }).background((Color(hex: 0x3E3F43)))
                        .clipShape(.buttonBorder)
                        .padding()
                        .shadow(radius: 5, x: 0, y: 5)
                }
                .background((Color(hex: 0x2F3035)))
                .clipShape(.buttonBorder)
                .padding()
                .sheet(isPresented: $coordinator.modalWindowIsOpened, onDismiss: {
                    editingIsDone()
                    tryToStartSearch()
                }, content: {
                    WhereToGoModalView()
                })
                
                VStack {
                    VStack(alignment: .leading) {
                        Text(verbatim: "Музыкально отлететь")
                            .clipped()
                            .font(Font.custom("SFProDisplay-Semibold", size: 22))
                            .padding(.bottom)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 67) {
                                ForEach(colabOffers.offers) { info in
                                    MusicOfferItem(offerInfo: info)
                                }
                            }
                        }
                    }.padding(.horizontal)
                        
                }
            }
        }).ignoresSafeArea(.keyboard)
            .onTapGesture {
                editingIsDone()
            }
        
    }
}


#Preview {
    StartView()
}

