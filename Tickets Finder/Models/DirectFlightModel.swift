//
//  DirectFlightModel.swift
//  Tickets Finder
//
//  Created by mix on 26.06.2024.
//

import Foundation

// MARK: - Welcome
struct DirectFlightModel: Codable {
    let ticketsOffers: [TicketsOffer]

    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

// MARK: - TicketsOffer
struct TicketsOffer: Codable, Identifiable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price

    enum CodingKeys: String, CodingKey {
        case id, title
        case timeRange = "time_range"
        case price
    }
}

