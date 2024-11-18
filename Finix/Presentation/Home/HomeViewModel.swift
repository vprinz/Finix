// Created by Igor Uglev on 17.11.24.

import SwiftUI

extension HomeView {
    class ViewModel: ObservableObject {
        
        // TODO: Get date from a corresponding service
        private var dailyBudget: CurrencyValue = .init(currency: .usd, value: 100)
        
        // TODO: Get date from a corresponding service
        private var monthlyBudget: CurrencyValue = .init(currency: .usd, value: 3550)
        
        // FIXME: Should not be stored here
        private var dailySpending: CurrencyValue = .init(currency: .usd, value: 20.11)
        
        // FIXME: Should not be stored here
        private var monthlySpending: CurrencyValue = .init(currency: .usd, value: 2750.67)
        
        var walletCarouselTitle: String {
            "My wallet"
        }
        
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
        
        // MARK: - Private methods
        
        func expensesChartSegmentModel() -> ChartSegmentView.Model {
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
        
        func dailyChartSegmentModel() -> ChartSegmentView.Model {
            let percentage = leftForToday.value / dailyBudget.value
            
            return ChartSegmentView.Model(segments: [
                .init(percentage: percentage, color: .turquoise)
            ])
        }
        
        func monthlyChartSegmentModel() -> ChartSegmentView.Model {
            let percentage = leftForTheMonth.value / monthlyBudget.value
            
            return ChartSegmentView.Model(segments: [
                .init(percentage: percentage, color: .finixPink)
            ])
        }
    }
}

