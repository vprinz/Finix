// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

class WalletCardViewModel: ObservableObject, Identifiable {
    enum State {
        case plain
        case selected
    }
    
    let walletName: String
    let walletBalance: String
    let styleColor: Color
    let currencyIsoCode: String
    
    var backgroundColor: Color {
        switch state {
        case .plain:
            Color.textWhite
        case .selected:
            styleColor
        }
    }
    
    var textColor: Color {
        switch state {
        case .plain:
            Color.textSecondary
        case .selected:
            Color.textWhite
        }
    }
    
    @Published var state: State = .plain
    
    init(
        walletName: String = "",
        walletBalance: String = "",
        styleColor: Color,
        currencyIsoCode: String
    ) {
        self.walletName = walletName
        self.walletBalance = walletBalance
        self.styleColor = styleColor
        self.currencyIsoCode = currencyIsoCode
    }
}
