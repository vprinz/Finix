// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension ExpenseSummaryView {
    struct Model {
        let expensesAmountWithCurrency: String
        let monthlyBudgetAmountWithCurrency: String
    }
}

struct ExpenseSummaryView: View {
    let model: Model
    let chartSegmentModel: ChartSegmentView.Model
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading) {
                    Text("expensesText")
                        .font(.CaptionNarrowRegular)
                        .foregroundStyle(Color.textSecondary)
                        .padding(.bottom, 8)
                    Text(model.expensesAmountWithCurrency)
                        .font(.buttonMedium)
                        .foregroundStyle(Color.textPrimary)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("monthlyBudgetText")
                        .font(.CaptionNarrowRegular)
                        .foregroundStyle(Color.textSecondary)
                        .padding(.bottom, 8)
                    Text(model.monthlyBudgetAmountWithCurrency)
                        .font(.buttonMedium)
                        .foregroundStyle(Color.textPrimary)
                }
            }
            .padding(.vertical, 16)
            ChartSegmentView(model: chartSegmentModel)
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 20)
        .frame(minHeight: 106)
        .background(Color.white)
        .cornerRadius(12)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.25)
            .stroke(Color.borderStroke, lineWidth: 0.5)
        )
    }
}

#Preview {
    let model: ExpenseSummaryView.Model = ExpenseSummaryView.Model(
        expensesAmountWithCurrency: "$2 750.67",
        monthlyBudgetAmountWithCurrency: "$3 550.00"
    )
    
    let chartSegmentModel: ChartSegmentView.Model = ChartSegmentView.Model(segments: [
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.2, color: Color.lavender
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.1, color: Color.turquise
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.26, color: Color.lemon
        ),
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.24, color: Color.pink
        )
    ])
    
    HStack {
        ExpenseSummaryView(
            model: model,
            chartSegmentModel: chartSegmentModel
        )
        .frame(width: 361)
    }
    .frame(width: 600, height: 600)
    .background(Color.figmaBackground)
}
