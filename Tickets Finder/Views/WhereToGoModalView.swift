//
//  WhereToGoModalView.swift
//  Tickets Finder
//
//  Created by mix on 20.6.24..
//

import SwiftUI

struct WhereToGoModalView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
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
                            TextField("Откуда - Москва", text: $coordinator.fromWhereString)
                        }).onTapGesture {
                            coordinator.dismissSheet()
                        }
                        
                        Divider()
                        
                        HStack(content: {
                            
                            Image("i26")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .tint(.white)
                                .padding(.leading)
                            
                            TextField("Куда - Турция", text:  $coordinator.toWhereString)
                                .onSubmit(of: /*@START_MENU_TOKEN@*/.text/*@END_MENU_TOKEN@*/) {
                                    editingIsDone()
                                    coordinator.dismissSheet()
                                }
                                .focused($focusedField, equals: .toWhereTextField)
                                .onAppear(perform: {
                                    focusedField = .toWhereTextField
                                })
                            
                            VStack {
                                Button(action: {
                                    coordinator.toWhereString = ""
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
        .environment(\.colorScheme, .dark)
    }
}

#Preview {
    WhereToGoModalView()
}
