//  Created by Valerie N. Prinz on 16/10/2024.

import Foundation

class TransactionService: EntityService<Transaction> {
    
    func create(
        name: String,
        amount: Double,
        currency: Currency,
        exchangedAmount: Double? = nil,
        exchangedCurrency: Currency? = nil,
        note: String? = nil,
        date: Date = Date(),
        isHighlighted: Bool = false,
        wallet: Wallet
    ) throws -> Transaction {
        let transaction = Transaction(
            name: name,
            amount: amount,
            currency: currency,
            exchangedAmount: exchangedAmount,
            exchangedCurrency: exchangedCurrency,
            note: note,
            date: date,
            isHighlighted: isHighlighted,
            wallet: wallet
        )
        modelContext.insert(transaction)
        try modelContext.save()
        return transaction
    }
}
