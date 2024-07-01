//
//  JSONShowAllTicketsReader.swift
//  Tickets Finder
//
//  Created by mix on 27.06.2024.
//

import Foundation

class JSONShowAllTicketsReader: ObservableObject {
    
    @Published var tickets: [Ticket]!
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "allTickets", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let decodedData = try? JSONDecoder().decode(AllTicketsInfoModel.self, from: data) else { return }
        self.tickets = decodedData.tickets
    }
}
