//
//  JSONTicketsOffersReader.swift
//  Tickets Finder
//
//  Created by mix on 26.06.2024.
//

import Foundation

class JSONTicketsOffersReader: ObservableObject {
    
    @Published var ticketsOffer: [TicketsOffer]!
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "flights", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let decodedData = try? JSONDecoder().decode(DirectFlightModel.self, from: data) else { return }
        self.ticketsOffer = decodedData.ticketsOffers
    }
}
