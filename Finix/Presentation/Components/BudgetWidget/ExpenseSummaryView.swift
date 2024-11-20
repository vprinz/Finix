// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension ExpenseSummaryView {
    struct Model {
        let expensesAmountWithCurrency: String
        let monthlyBudgetAmountWithCurrency: String
        let chartSegmentModel: ChartSegmentView.Model
    }
}

struct ExpenseSummaryView: View {
    let model: Model
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("expensesText")
                        .font(.captionNarrowRegular)
                        .foregroundStyle(Color.textSecondary)
                        .padding(.bottom, 8)
                    Text(model.expensesAmountWithCurrency)
                        .font(.buttonMedium)
                        .foregroundStyle(Color.textPrimary)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("monthlyBudgetText")
                        .font(.captionNarrowRegular)
                        .foregroundStyle(Color.textSecondary)
                        .padding(.bottom, 8)
                    Text(model.monthlyBudgetAmountWithCurrency)
                        .font(.buttonMedium)
                        .foregroundStyle(Color.textPrimary)
                }
            }
            .padding(.vertical, 16)
            ChartSegmentView(model: model.chartSegmentModel)
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 20)
        .cardFrame()
    }
}

#Preview {
    let chartSegmentModel: ChartSegmentView.Model = ChartSegmentView.Model(segments: [
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
    
    let model: ExpenseSummaryView.Model = ExpenseSummaryView.Model(
        expensesAmountWithCurrency: "$2 750.67",
        monthlyBudgetAmountWithCurrency: "$3 550.00", chartSegmentModel: chartSegmentModel
    )
    
    HStack {
        ExpenseSummaryView(model: model)
        .frame(width: 361)
    }
    .frame(width: 600, height: 600)
    .background(Color.finixBackground)
}
