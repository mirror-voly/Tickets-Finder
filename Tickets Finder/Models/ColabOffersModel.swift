//
//  ColabOffersModel.swift
//  Tickets Finder
//
//  Created by mix on 18.6.24..
//

import Foundation

// MARK: - Welcome
struct ColabOffersModel: Codable {
    let offers: [Offer]
}

// MARK: - Offer
struct Offer: Codable, Identifiable {
    let id: Int
    let title, town: String
    let price: Price
}

// MARK: - Price
struct Price: Codable {
    let value: Int
}
