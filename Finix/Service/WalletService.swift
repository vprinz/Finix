//  Created by Valerie N. Prinz on 10/10/2024.

import Foundation
import SwiftData

struct WalletService {
    let modelContext: ModelContext
    
    func create(name: String, currency: Currency) throws -> Wallet {
        let wallet = Wallet(name: name, currency: currency)
        modelContext.insert(wallet)
        try modelContext.save()
        return wallet
    }
    
    func delete(_ wallet: Wallet) throws {
        modelContext.delete(wallet)
        try modelContext.save()
    }
}
