//  Created by Valerie N. Prinz on 10/10/2024.

import Foundation
import SwiftData

@Model
final class Wallet {
    @Attribute(.unique) var id: UUID
    var name: String
    var currency: Currency
    
    init(id: UUID = UUID(), name: String, currency: Currency) {
        self.id = id
        self.name = name
        self.currency = currency
    }
}
