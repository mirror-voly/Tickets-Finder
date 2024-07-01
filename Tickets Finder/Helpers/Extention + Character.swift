//
//  Extention + Character.swift
//  Tickets Finder
//
//  Created by mix on 28.06.2024.
//

import Foundation

extension Character {
    var isCyrillic: Bool {
        if self == " " {
            return true
        }
        return "А"..."я" ~= self
    }
}
