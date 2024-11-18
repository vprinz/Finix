//  Created by Valerie N. Prinz on 09/10/2024.

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        NavigationLink(value: HomeRoute.history) {
            VStack(spacing: 24) {
                header
                upcomingPayments
                recentTransactions
                Spacer()
            }
            .padding(.horizontal, 16)
            .background(Color.finixBackground)
        }
    }
    
    var header: some View {
        VStack(alignment: .leading, spacing: 16) {
            // TODO: User info
            HStack(spacing: 16) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                Text("Hi, Valerie N. Prinz")
                    .font(.titleMedium)
                    .foregroundStyle(Color.textPrimary)
            }
            .padding(.bottom, 20)
            .padding(.top, 16)
            SectionLinkView(sectionTitle: viewModel.walletCarouselTitle)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    Group {
                        Text("$1,000.00")
                        Text("$1,000.00")
                        Text("$1,000.00")
                        Text("$1,000.00")
                    }
                    .frame(width: 132, height: 88)
//                    .card()
                }
            }
            // TODO: Wallets
            ExpenseSummaryView(model: viewModel.expensesModel)
            HStack(spacing: 8) {
                PeriodBudgetView(model: viewModel.dailyBudgetModel)
                PeriodBudgetView(model: viewModel.monthlyBudgetModel)
            }
        }
        .background {
            VStack {
                Image("background")
                    .blur(radius: 16)
                Spacer()
            }.ignoresSafeArea()
        }
    }
    
    var upcomingPayments: some View {
        HomeSection(title: "Upcoming payments", showButton: true)
    }
    
    var recentTransactions: some View {
        HomeSection(title: "Recent transactions", showButton: true)
    }
}

#Preview {
    HomeView(viewModel: .init())
}
