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
            ProfileHeaderView(model: viewModel.profileHeaderModel)
            .padding(.bottom, 20)
            .padding(.top, 70)
            .padding(.horizontal, 16)
            
            SectionLinkView(
                sectionTitle: String(localized: "myWalletText"),
                showSeeAllButton: false
            )
            .padding(.horizontal, 24)
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(viewModel.walletViewModels) { viewModel in
                        MediumWalletCardView(viewModel: viewModel)
                    }
                    ForEach(viewModel.actionWalletModels) { model in
                        ActionMediumWalletCardView(model: model)
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
            
            ExpenseSummaryView(model: viewModel.expensesModel)
                .padding(.horizontal, 16)
            Group {
                if !viewModel.monthlyBudget.value.isZero {
                    limitWidgets
                } else {
                    limitEmptyState
                }
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
    
    var limitWidgets: some View {
        HStack(spacing: 8) {
            PeriodBudgetView(model: viewModel.dailyBudgetModel)
            PeriodBudgetView(model: viewModel.monthlyBudgetModel)
        }
    }
    
    var limitEmptyState: some View {
        EmptyStateView(model: viewModel.limitEmptyStateModel)
    }
    
    var upcomingPayments: some View {
        HomeSection(
            title: String(localized: "upcomingPaymentsText"),
            trasnactionModels: viewModel.upcomingPaymentModels,
            emptyStateModel: viewModel.upcomingPaymentsEmptyStateModel
        )
    }
    
    var recentTransactions: some View {
        HomeSection(
            title: String(localized: "recentTransactionsText"),
            trasnactionModels: viewModel.recentTransactionModels,
            emptyStateModel: viewModel.recentTrasnactionsEmptyStateModel
        )
    }
}

#Preview {
    HomeView(viewModel: .init())
}
