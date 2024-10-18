//  Created by Valerie N. Prinz on 10/10/2024.

import Foundation
import SwiftData

@Model
final class Wallet {
    @Attribute(.unique) var id = UUID()
    var name: String
    var currency: Currency
    @Relationship(deleteRule: .cascade, inverse: \Transaction.wallet) var transactions = [Transaction]()
    
    init(id: UUID = UUID(), name: String, currency: Currency, transactions: [Transaction] = [Transaction]()) {
        self.id = id
        self.name = name
        self.currency = currency
        self.transactions = transactions
    }
}
