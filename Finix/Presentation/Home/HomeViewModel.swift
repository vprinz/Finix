// Created by Igor Uglev on 17.11.24.

import SwiftUI

class HomeViewModel: ObservableObject {
    
    // MARK: - Profile Header
    
    var profileHeaderModel: ProfileHeaderView.Model {
        // TODO: add real user
        .init(size: .small, name: "Valerie N. Prinz")
    }
    
    // MARK: - Wallets
    
    // TODO: Get real data
    var walletViewModels: [WalletCardViewModel] {
        [
            .init(
                walletName: "Cash",
                walletBalance: "$750",
                styleColor: Color.customPrimary,
                currencyIsoCode: "USD"
            )
        ]
    }
    
    var actionWalletModels: [ActionWalletCardModel] {
        [
            .init(actionType: .addAccount),
            .init(actionType: .seeAll)
        ]
    }
    
    // MARK: - Budget Dashboard
    
    var expensesModel: ExpenseSummaryView.Model {
        .init(
            expensesAmountWithCurrency: monthlySpending.toString(),
            monthlyBudgetAmountWithCurrency: monthlyBudget.toString(),
            chartSegmentModel: expensesChartSegmentModel()
        )
    }
    
    var dailyBudgetModel: PeriodBudgetView.Model {
        .init(
            periodType: .daily,
            budgetAmountWithCurrency: leftForToday.toString(),
            chartSegmentModel: dailyChartSegmentModel()
        )
    }
    
    var monthlyBudgetModel: PeriodBudgetView.Model {
        .init(
            periodType: .monthly,
            budgetAmountWithCurrency: leftForTheMonth.toString(),
            chartSegmentModel: monthlyChartSegmentModel()
        )
    }
    
    // MARK: - Upcoming payments
    
    // TODO: Get data from a corresponding service
    var upcomingPaymentModels: [TransactionExpenseCardView.Model] {
        [
//            .init(
//                categoryIconName: "buildings",
//                categoryIconColor: Color.midnight,
//                transactionName: "Rent",
//                amountWithCurrency: CurrencyValue(currency: .usd, value: 1050).toString()
//            ),
//            .init(
//                categoryIconName: "bank",
//                categoryIconColor: Color.customPrimary,
//                transactionName: "Installment",
//                amountWithCurrency: CurrencyValue(currency: .usd, value: 125).toString()
//            ),
//            .init(
//                categoryIconName: "player",
//                categoryIconColor: Color.aquamarine,
//                transactionName: "Netflix",
//                amountWithCurrency: CurrencyValue(currency: .usd, value: 18.99).toString()
//            )
        ]
    }
    
    // MARK: - Recent transactions
    
    // TODO: Get data from a corresponding service
    var recentTransactionModels: [TransactionExpenseCardView.Model] {
        [
            .init(
                categoryIconName: "apple",
                categoryIconColor: Color.finixGreen,
                transactionName: "Lidl",
                amountWithCurrency: CurrencyValue(currency: .usd, value: 16.89).toString()
            ),
            .init(
                categoryIconName: "cup",
                categoryIconColor: Color.finixOrange,
                transactionName: "Starbucks",
                amountWithCurrency: CurrencyValue(currency: .usd, value: 4.49).toString()
            ),
            .init(
                categoryIconName: "lamp",
                categoryIconColor: Color.finixYellow,
                transactionName: "Electicity",
                amountWithCurrency: CurrencyValue(currency: .usd, value: 40).toString()
            )
        ]
    }
    
    // MARK: - EmptyState models
    
    var upcomingPaymentsEmptyStateModel: EmptyStateView.Model {
        .init(state: .upcomingTransaction) {
            // TODO: Add action
        }
    }
    
    var recentTrasnactionsEmptyStateModel: EmptyStateView.Model {
        .init(state: .recentTransaction) {
            // TODO: Add action
        }
    }
    
    // MARK: - Private methods
    
    private func expensesChartSegmentModel() -> ChartSegmentView.Model {
        // FIXME: replace with real values
        let segments = [
            ChartSegmentView.Model.SegmentItem(
                percentage: 0.2, color: Color.lavender
            ),
            ChartSegmentView.Model.SegmentItem(
                percentage: 0.1, color: Color.turquoise
            ),
            ChartSegmentView.Model.SegmentItem(
                percentage: 0.26, color: Color.lemon
            ),
            ChartSegmentView.Model.SegmentItem(
                percentage: 0.24, color: Color.pink
            )
        ]
        
        return ChartSegmentView.Model(segments: segments)
    }
    
    private func dailyChartSegmentModel() -> ChartSegmentView.Model {
        let percentage = leftForToday.value / dailyBudget.value
        
        return ChartSegmentView.Model(segments: [
            .init(percentage: percentage, color: .turquoise)
        ])
    }
    
    private func monthlyChartSegmentModel() -> ChartSegmentView.Model {
        let percentage = leftForTheMonth.value / monthlyBudget.value
        
        return ChartSegmentView.Model(segments: [
            .init(percentage: percentage, color: .finixPink)
        ])
    }
    
    // TODO: Get date from a corresponding service
    private var dailyBudget: CurrencyValue = .init(currency: .usd, value: 100)
    
    // TODO: Get date from a corresponding service
    private var monthlyBudget: CurrencyValue = .init(currency: .usd, value: 3550)
    
    // FIXME: Should not be stored here
    private var dailySpending: CurrencyValue = .init(currency: .usd, value: 20.11)
    
    // FIXME: Should not be stored here
    private var monthlySpending: CurrencyValue = .init(currency: .usd, value: 2750.67)
    
    private var leftForToday: CurrencyValue {
        CurrencyValue(
            currency: .usd,
            value: dailyBudget.value - dailySpending.value
        )
    }
    
    private var leftForTheMonth: CurrencyValue {
        CurrencyValue(
            currency: .usd,
            value: monthlyBudget.value - monthlySpending.value
        )
    }
}
