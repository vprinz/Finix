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
    
    func update(_ wallet: Wallet, name: String?, currency: Currency?) throws -> (Wallet, Bool) {
        var isUpdated = false
        
        if let name = name, wallet.name != name {
            wallet.name = name
            isUpdated = true
        }
        
        if let curency = currency, wallet.currency != curency {
            wallet.currency = curency
            isUpdated = true
        }
        
        if isUpdated {
            try modelContext.save()
        }
        return (wallet, isUpdated)
    }
}
