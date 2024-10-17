//  Created by Valerie N. Prinz on 10/10/2024.

import Foundation
import SwiftData

class WalletService: EntityService<Wallet> {
    
    func create(name: String, currency: Currency) throws -> Wallet {
        let wallet = Wallet(name: name, currency: currency)
        modelContext.insert(wallet)
        try modelContext.save()
        return wallet
    }
}
