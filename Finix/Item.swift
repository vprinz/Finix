//
//  Item.swift
//  Finix
//
//  Created by Valerie N. Prinz on 05/10/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
