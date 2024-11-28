//  Created by Valerie N. Prinz on 09/10/2024.

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                header
                upcomingPayments
                    .padding(.horizontal, 16)
                recentTransactions
                    .padding(.horizontal, 16)
                Spacer()
            }
        }
        .scrollIndicators(.hidden)
        .background(Color.finixBackground)
        .ignoresSafeArea()
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
            .padding(.top, 70)
            .padding(.horizontal, 16)
            SectionLinkView(
                sectionTitle: String(localized: "myWalletText")
            )
            .padding(.horizontal, 24)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(0..<5) {
                        Text("$\($0+1 * 1000)")
                    }
                    .frame(width: 132)
                    .cardFrame(
                        height: 88,
                        backgroundColor: Color.textWhite,
                        cornerRadius: 10,
                        strokeColor: Color.borderStroke
                    )
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            // TODO: Wallets
            ExpenseSummaryView(model: viewModel.expensesModel)
                .padding(.horizontal, 16)
            HStack(spacing: 8) {
                PeriodBudgetView(model: viewModel.dailyBudgetModel)
                PeriodBudgetView(model: viewModel.monthlyBudgetModel)
            }
            .padding(.horizontal, 16)
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
        HomeSection(
            title: String(localized: "upcomingPaymentsText"),
            trasnactionModels: viewModel.upcomingPaymentModels
        )
    }
    
    var recentTransactions: some View {
        HomeSection(
            title: String(localized: "recentTransactionsText"),
            trasnactionModels: viewModel.recentTransactionModels
        )
    }
}

#Preview {
    HomeView(viewModel: .init())
}
