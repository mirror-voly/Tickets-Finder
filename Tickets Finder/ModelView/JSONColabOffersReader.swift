//
//  JSONReader.swift
//  Tickets Finder
//
//  Created by mix on 18.6.24..
//

import Foundation

class JSONColabOffersReader: ObservableObject {
    
    @Published var offers: [Offer]!
    
    init() {
        fetchData() 
    }
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "offers", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        guard let decodedData = try? JSONDecoder().decode(ColabOffersModel.self, from: data) else { return }
        self.offers = decodedData.offers
    }
}
