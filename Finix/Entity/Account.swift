//  Created by Valerie N. Prinz on 16/10/2024.

import Foundation
import SwiftData

@Model
final class Account {
    @Attribute(.unique) var id = UUID()
    var mainCurrency: Currency
    var showNotifications = false
    
    init(id: UUID = UUID(), mainCurrency: Currency, showNotifications: Bool = false) {
        self.id = id
        self.mainCurrency = mainCurrency
        self.showNotifications = showNotifications
    }
}
