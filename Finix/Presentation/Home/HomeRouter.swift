// Created by Igor Uglev on 17.10.24.

import SwiftUI

enum HomeRoute: Route {
    case home
    case history
    case upcomingPayments
    
    func view() -> some View {
        switch self {
        case .home:
            HomeView()
        case .history:
            TransactioonHistoryView()
        case .upcomingPayments:
            Text("Not inplemented")
        }
    }
}

struct HomeRouter: View {
    
    var body: some View {
        NavigationStack() {
            HomeView()
                .navigationDestination(for: HomeRoute.self) { homeRoute in
                    homeRoute.view()
                }
        }
    }
}
