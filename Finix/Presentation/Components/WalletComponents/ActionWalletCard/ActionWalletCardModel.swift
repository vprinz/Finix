// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

struct ActionWalletCardModel {
    enum ActionType {
        case addAccount
        case seeAll
    }
    
    let actionType: ActionType
    
    var actionName: String {
        switch actionType {
        case .addAccount:
            String(localized: "addAccountText")
        case .seeAll:
            String(localized: "seeAllText")
        }
    }
    
    var iconName: String {
        switch actionType {
        case .addAccount: "plus-circle"
        case .seeAll: "arrow-right-circle"
        }
    }
}
