// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension ExpenseSummaryView {
    struct Model {
        let expensesAmountWithCurrency: String
        let monthlyBudgetAmountWithCurrency: String?
        let chartSegmentModel: ChartSegmentView.Model
        
        init(
            expensesAmountWithCurrency: String,
            monthlyBudgetAmountWithCurrency: String? = nil,
            chartSegmentModel: ChartSegmentView.Model
        ) {
            self.expensesAmountWithCurrency = expensesAmountWithCurrency
            self.monthlyBudgetAmountWithCurrency = monthlyBudgetAmountWithCurrency
            self.chartSegmentModel = chartSegmentModel
        }
    }
}

struct ExpenseSummaryView: View {
    let model: Model
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                expenses
                Spacer()
                monthlyBudget
            }
            .padding(.vertical, 16)
            ChartSegmentView(model: model.chartSegmentModel)
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 20)
        .cardFrame()
    }
    
    var expenses: some View {
        VStack(alignment: .leading) {
            Text("expensesText")
                .font(.captionNarrowRegular)
                .foregroundStyle(Color.textSecondary)
                .padding(.bottom, 8)
            Text(model.expensesAmountWithCurrency)
                .font(.buttonMedium)
                .foregroundStyle(Color.textPrimary)
        }
    }
    
    var monthlyBudget: some View {
        model.monthlyBudgetAmountWithCurrency.map { monthlyBudget in
            VStack(alignment: .trailing) {
                Text("monthlyBudgetText")
                    .font(.captionNarrowRegular)
                    .foregroundStyle(Color.textSecondary)
                    .padding(.bottom, 8)
                Text(monthlyBudget)
                    .font(.buttonMedium)
                    .foregroundStyle(Color.textPrimary)
            }
        }
    }
}

#Preview {
    let chartSegmentModel = ChartSegmentView.Model(segments: [
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
    ])
    
    let chartSegmentModelFull = ChartSegmentView.Model(segments: [
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.3, color: Color.lavender
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.2, color: Color.turquoise
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.35, color: Color.lemon
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.15, color: Color.pink
        )
    ])
    
    let modelWithBudget = ExpenseSummaryView.Model(
        expensesAmountWithCurrency: "$2 750.67",
        monthlyBudgetAmountWithCurrency: "$3 550.00",
        chartSegmentModel: chartSegmentModel
    )
    
    let modelWithoutBudget = ExpenseSummaryView.Model(
        expensesAmountWithCurrency: "$2 750.67",
        chartSegmentModel: chartSegmentModelFull
    )
    
    VStack {
        ExpenseSummaryView(model: modelWithBudget)
        .frame(width: 361)
        
        ExpenseSummaryView(model: modelWithoutBudget)
        .frame(width: 361)
    }
    .frame(width: 600, height: 600)
    .background(Color.finixBackground)
}
