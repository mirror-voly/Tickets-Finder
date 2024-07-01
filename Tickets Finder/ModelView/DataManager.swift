//
//  DataManager.swift
//  Tickets Finder
//
//  Created by mix on 28.06.2024.
//

import Foundation

class DataManager {
    
    func saveData(fromWhereString: String, toWhereString: String) {
        let cityNames = [fromWhereString, toWhereString]
        UserDefaults.standard.set(cityNames, forKey: "cityNames")
    }
    
    func loadData() -> [String]? {
        guard let data = UserDefaults.standard.stringArray(forKey: "cityNames") else { return nil }
        return data
    }
    
}
