//
//  SearchStartedView.swift
//  Tickets Finder
//
//  Created by mix on 28.06.2024.
//

import SwiftUI

struct SearchStartedView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var tiketsOffer = JSONTicketsOffersReader()
    @FocusState private var focusedField: Field?
    
    @State private var datePickerIsPresented = false
    @State private var datePickerForward = true
    @State private var subsription = false
    
    private enum Field: Int, Hashable {
        case fromWhereTextField
        case toWhereTextField
    }
    
    private func editingIsDone() {
        focusedField = nil
    }
    
    private func startSearch() {
        if coordinator.fromWhereString != "" && coordinator.toWhereString != "" {
            coordinator.changePage(page: .two)
        }
    }
    
    var body: some View {
        
        VStack {
            VStack {
                HStack(content: {
                    
                    Button("", image: ImageResource(name: "i3", bundle: .main)) {
                        coordinator.changePage(page: .one)
                    } .padding(.leading)
                    VStack(content: {
                        
                        HStack(content: {
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
                                    if coordinator.fromWhereString != "" && coordinator.toWhereString == "" {
                                        coordinator.modalWindowIsOpened = true
                                    }
                                    startSearch()
                                }
                                .focused($focusedField, equals: .fromWhereTextField)
                            VStack {
                                Button(action: {
                                    (coordinator.fromWhereString, coordinator.toWhereString) = (coordinator.toWhereString, coordinator.fromWhereString)
                                }, label: {
                                    Image("i18")
                                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                        .tint(.white)
                                }).frame(width: 8, height: 8)
                                    .padding(.horizontal)
                            }
                        })
                        
                        Divider()
                        
                        HStack(content: {
                            TextField("Куда - Турция", text:  $coordinator.toWhereString)
                                .onChange(of: coordinator.toWhereString, { oldValue, newValue in
                                    if !newValue.isEmpty {
                                        let filteredText = newValue.filter { $0.isCyrillic }
                                        if filteredText != newValue {
                                            coordinator.toWhereString = filteredText
                                        }
                                    }
                                })
                                .onTapGesture {
                                    coordinator.modalWindowIsOpened = true
                                }
                                .focused($focusedField, equals: .toWhereTextField)
                            VStack {
                                Button(action: {
                                    coordinator.toWhereString = ""
                                    coordinator.changePage(page: .one)
                                }, label: {
                                    Image("i17")
                                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                        .tint(.white)
                                }).frame(width: 8, height: 8)
                                    .padding(.horizontal)
                            }
                        })
                    })
                    .font(Font.custom("SFProDisplay-Regular", size: 16))
                    .padding()
                }).background(Color(hex: 0x2F3035))
                    .clipShape(.buttonBorder)
                    .padding()
                    .shadow(radius: 5, x: 0, y: 5)
            }
            
            .sheet(isPresented: $coordinator.modalWindowIsOpened, onDismiss: {
                editingIsDone()
                startSearch()
            }, content: {
                WhereToGoModalView()
            })
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 8, content: {
                    HStack(spacing: 8, content: {
                        if !datePickerForward {
                            Text ("\(coordinator.flightBackDate, format: .dateTime.day()) \(coordinator.flightBackDate, format: .dateTime.month())").textCase(.lowercase)
                                .font(Font(.init(.label, size: 14)))
                                .italic()
                                .padding(.vertical, 8.0)
                                .padding(.leading, 8.0)
                            Text (", \(coordinator.flightBackDate, format: .dateTime.weekday())").textCase(.lowercase)
                                .font(Font(.init(.label, size: 14)))
                                .italic()
                                .padding(.leading, -8.0)
                                .padding(.trailing, 8.0)
                                .foregroundColor(Color(hex: 0x9F9F9F))
                        } else {
                            Image("i10")
                                .padding(.leading)
                                .frame(width: 16, height: 16)
                            Text ("обратно")
                                .font(Font(.init(.label, size: 14)))
                                .italic()
                                .shadow(radius: 1, x: 1, y: 1)
                                .padding(8.0)
                        }
                    })
                    
                    .background(Color(hex: 0x2F3035))
                    .clipShape(.rect(cornerRadius: 50))
                    .onTapGesture {
                        datePickerForward = false
                        datePickerIsPresented = true
                    }
                    
                    
                    HStack(spacing: 8.0, content: {
                        Text ("\(coordinator.flightDate, format: .dateTime.day()) \(coordinator.flightDate, format: .dateTime.month())").textCase(.lowercase)
                            .padding(.vertical, 8.0)
                            .padding(.leading, 8.0)
                        Text (", \(coordinator.flightDate, format: .dateTime.weekday())").textCase(.lowercase)
                            .padding(.leading, -8.0)
                            .padding(.trailing, 8.0)
                            .foregroundColor(Color(hex: 0x9F9F9F))
                        
                    }).background(Color(hex: 0x2F3035))
                        .onTapGesture(perform: {
                            datePickerForward = true
                            datePickerIsPresented = true
                        })
                        .clipShape(.rect(cornerRadius: 50))
                        
                    
                    HStack(spacing: 8.0, content: {
                        Image("i1")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .frame(width: 16, height: 16)
                            .padding(.vertical, 8.0)
                            .padding(.leading, 8.0)
                        Text ("1,эконом")
                            .padding(.trailing, 8.0)
                    }).background(Color(hex: 0x2F3035))
                        .clipShape(.rect(cornerRadius: 50))
                    
                    HStack(spacing: 8.0, content: {
                        Image("i2")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .frame(width: 16, height: 16)
                            .padding(.vertical, 8.0)
                            .padding(.leading, 8.0)
                        Text ("фильтры")
                            .padding(.trailing, 8.0)
                    }).background(Color(hex: 0x2F3035))
                        .clipShape(.rect(cornerRadius: 50))
                    
                })
                .font(Font.custom("SFProDisplay-Regular", size: 14))
                .italic()
                .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .sheet(isPresented: $datePickerIsPresented, content: {
                        DatePopoverView(datePickerPresented: $datePickerIsPresented, datePickerIsOnFlightDate: datePickerForward)
                    })
            }
            VStack(alignment: .center, content: {
                VStack(alignment: .leading, content: {
                    Text("Прямые рейсы")
                        .padding()
                        .multilineTextAlignment(.leading)
                        .font(Font.custom("SFProDisplay-Semibold", size: 20))
                    VStack(content: {
                        ForEach(tiketsOffer.ticketsOffer) { info in
                            DirectFlightItem(ticket: info)
                        }
                    }).padding(.leading)
                })
            })
            .background(Color(hex: 0x1D1E20))
            .clipShape(.rect(cornerRadius: 16))
            .padding()
            
            VStack(alignment: .center, content: {
                Button(action: {
                    coordinator.changePage(page: .three)
                }, label: {
                    Text("Посмотреть все билеты")
                        .padding()
                        .foregroundStyle(Color.white)
                        .font(Font.custom("SFProDisplay-Regular", size: 16))
                        .italic()
                })
                .frame(maxWidth: .infinity)
                .background(Color(hex: 0x2261BC))
            })
            .clipShape(.rect(cornerRadius: 8))
            .padding(.horizontal)
            
            VStack(alignment: .center, content: {
                HStack(content: {
                    HStack {
                        Image("i25")
                            .resizable()
                            .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                            .frame(width: 25,height: 25)
                            .padding(.leading)
                            .foregroundStyle(Color(hex: 0x2261BC))
                        Text("Подписка на цену")
                            .lineLimit(1)
                            .fixedSize()
                            .font(Font.custom("SFProDisplay-Regular", size: 16))
                    }
                    Toggle(isOn: $subsription) {
                        
                    }.padding(.trailing)
                    
                }).padding(.vertical)
            })
            .background(Color(hex: 0x242529))
            .clipShape(.rect(cornerRadius: 8))
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    SearchStartedView()
}
