// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension PeriodBudgetView {
    struct Model {
        enum PeriodType {
            case daily
            case monthly
        }
        
        var periodType: PeriodType = .daily
        let budgetAmountWithCurrency: String
        
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
    let chartSegmentModel: ChartSegmentView.Model
    
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
            ChartSegmentView(model: chartSegmentModel)
                .padding(.vertical, 16)
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
    let chartSegmentModelToday: ChartSegmentView.Model = ChartSegmentView.Model(segments: [
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.75, color: Color.turquise
        )
    ])
    let modelToday: PeriodBudgetView.Model = PeriodBudgetView.Model(
        periodType: .daily,
        budgetAmountWithCurrency: "$69.77"
    )
    
    let chartSegmentModelMonth: ChartSegmentView.Model = ChartSegmentView.Model(segments: [
        ChartSegmentView.Model.SegmentItem(
            percentage: 0.3, color: Color.pink
        )
    ])
    let modelMonth: PeriodBudgetView.Model = PeriodBudgetView.Model(
        periodType: .monthly,
        budgetAmountWithCurrency: "$799.33"
    )
    
    HStack {
        PeriodBudgetView(
            model: modelToday,
            chartSegmentModel: chartSegmentModelToday
        )
        .frame(width: 177)
        PeriodBudgetView(
            model: modelMonth,
            chartSegmentModel: chartSegmentModelMonth
        )
        .frame(width: 177)
    }
    .frame(width: 400, height: 400)
    .background(Color.figmaBackground)
}
