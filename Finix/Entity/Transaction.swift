//  Created by Valerie N. Prinz on 16/10/2024.

import Foundation
import SwiftData

@Model
final class Transaction {
    @Attribute(.unique) var id = UUID()
    var name: String
    var amount: Double
    var currency: Currency
    var exchangedAmount: Double?
    var exchangedCurrency: Currency?
    var note: String?
    var date: Date = Date()
    var isHighlighted: Bool = false
    var wallet: Wallet
    
    init(id: UUID = UUID(), name: String, amount: Double, currency: Currency, exchangedAmount: Double? = nil, exchangedCurrency: Currency? = nil, note: String? = nil, date: Date, isHighlighted: Bool, wallet: Wallet) {
        self.id = id
        self.name = name
        self.amount = amount
        self.currency = currency
        self.exchangedAmount = exchangedAmount
        self.exchangedCurrency = exchangedCurrency
        self.note = note
        self.date = date
        self.isHighlighted = isHighlighted
        self.wallet = wallet
    }
}
