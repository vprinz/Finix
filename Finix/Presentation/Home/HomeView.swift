//  Created by Valerie N. Prinz on 09/10/2024.

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            header
            upcomingPayments
            recentTransactions
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(Color.finixBackground)
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
            SectionLinkView(sectionTitle: String(localized: "My wallet"))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(0..<5) {
                        Text("$\($0+1 * 1000)")
                    }
                    .frame(width: 132)
                    .walletCardFrame(
                        height: 88,
                        backgroundColor: Color.textWhite,
                        cornerRadius: 10,
                        strokeColor: Color.borderStroke
                    )
                }
            }
            .padding(.trailing, -16)
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
