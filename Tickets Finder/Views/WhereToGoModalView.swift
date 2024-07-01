//
//  WhereToGoModalView.swift
//  Tickets Finder
//
//  Created by mix on 20.6.24..
//

import SwiftUI

struct WhereToGoModalView: View {
    
    @EnvironmentObject private var global: GlobalState
    @FocusState private var focusedField: Field?
    
    private enum Field: Int, Hashable {
        case fromWhereTextField
        case toWhereTextField
    }
    
    private func editingIsDone() {
        focusedField = nil
    }
    
    
    var body: some View {
        
        GeometryReader(content: { geometry in
            VStack {
                
                Rectangle().frame(width: 38, height: 5)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.top)
                
                VStack {
                    VStack {
                        HStack(content: {
                            Image("i29")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .tint(.white)
                                .padding(.leading)
                            TextField("Откуда - Москва", text: $global.fromWhereString)
                                .onSubmit(of: .text) {
                                    if global.toWhereString == "" {
                                        focusedField = .toWhereTextField
                                    }
                                }
                                .focused($focusedField, equals: .fromWhereTextField)
                        })
                        
                        Divider()
                        
                        HStack(content: {
                            
                            Image("i26")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .tint(.white)
                                .padding(.leading)
                            
                            TextField("Куда - Турция", text:  $global.toWhereString)
                                .onSubmit(of: /*@START_MENU_TOKEN@*/.text/*@END_MENU_TOKEN@*/) {
                                    editingIsDone()
                                    global.modalWindowIsOpened = false
                                }
                                .focused($focusedField, equals: .toWhereTextField)
                                .onAppear(perform: {
                                    focusedField = .toWhereTextField
                                })
                            
                            VStack {
                                Button(action: {
                                    global.toWhereString = ""
                                }, label: {
                                    Image("i17")
                                        .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                        .tint(.white)
                                }).frame(width: 8, height: 8)
                                    .padding(.horizontal)
                            }
                            
                        })
                    }
                    .font(Font.custom("SFProDisplay-Regular", size: 16))
                    .padding()
                }
                .background(Color(hex: 0x2F3035))
                .clipShape(.rect(cornerRadius: 16))
                .frame(height: 96)
                .padding()
                .shadow(radius: 5, x: 0, y: 5)
                
                WhereToGoHintsView()
                
                Spacer()
            }
            .background(Color(hex: 0x242529))
            .onTapGesture {
                editingIsDone()
            }
        })
        .ignoresSafeArea(.keyboard)
        
    }
}

#Preview {
    WhereToGoModalView()
}
