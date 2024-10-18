// Created by Igor Uglev on 17.10.24.

import SwiftUI

enum AccountRoute: Route {
    case account
    case currency
    case analytics
    case categories
    case recurringTransactions
    case highlightedTransactions
    
    func view() -> some View {
        switch self {
        case .account:
            AccountView()
        default:
            Text("Not implemented yet")
        }
    }
}

struct AccountRouter: View {
    
    var body: some View {
        NavigationStack() {
            AccountView()
                .navigationDestination(for: AccountRoute.self) { accountRoute in
                    accountRoute.view()
                }
        }
    }
}
