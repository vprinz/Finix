// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension PeriodBudgetView {
    struct Model {
        enum PeriodType {
            case daily
            case monthly
        }
        
        var periodType: PeriodType
        let budgetAmountWithCurrency: String
        let chartSegmentModel: ChartSegmentView.Model
        
        var periodText: String  {
            switch periodType {
            case .daily:
                String(localized: "leftTodayText")
            case .monthly:
                String(localized: "leftThisMonthText")
            }
        }
    }
}

struct PeriodBudgetView: View {
    let model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(model.periodText)
                .font(.captionNarrowRegular)
                .foregroundStyle(Color.textSecondary)
                .padding(.top, 16)
                .padding(.bottom, 8)
            Text(model.budgetAmountWithCurrency)
                .font(.buttonMedium)
                .foregroundStyle(Color.textPrimary)
            ChartSegmentView(model: model.chartSegmentModel)
                .padding(.vertical, 16)
        }
        .padding(.horizontal, 20)
        .cardFrame()
    }
}

#Preview {
    let chartSegmentModelToday: ChartSegmentView.Model = ChartSegmentView.Model(segments: [
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.75, color: Color.turquoise
        )
    ])
    let modelToday: PeriodBudgetView.Model = PeriodBudgetView.Model(
        periodType: .daily,
        budgetAmountWithCurrency: "$69.77",
        chartSegmentModel: chartSegmentModelToday
    )
    
    let chartSegmentModelMonth: ChartSegmentView.Model = ChartSegmentView.Model(segments: [
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.3, color: Color.pink
        )
    ])
    let modelMonth: PeriodBudgetView.Model = PeriodBudgetView.Model(
        periodType: .monthly,
        budgetAmountWithCurrency: "$799.33",
        chartSegmentModel: chartSegmentModelMonth
    )
    
    HStack {
        PeriodBudgetView(model: modelToday)
        .frame(width: 177)
        PeriodBudgetView(model: modelMonth)
        .frame(width: 177)
    }
    .frame(width: 400, height: 400)
    .background(Color.finixBackground)
}
