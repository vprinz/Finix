// Created by Valerie N. Prinz on 24/10/2024.

import SwiftUI

extension PeriodSummaryView {
    struct Model {
        enum `Type` {
            case expenses
            case incomes
        }
        
        let type: `Type`
        let value: CurrencyValue
        
        var title: String {
            switch type {
            case .expenses: String(localized: "expensesText")
            case .incomes: String(localized: "incomesText")
            }
        }
        
        var color: Color {
            switch type {
            case .expenses: .error
            case .incomes: .success
            }
        }
        
        var iconAngelDegree: Angle {
            switch type {
            case .expenses: Angle(degrees: 0)
            case .incomes: Angle(degrees: 90)
            }
        }
    }
}

struct PeriodSummaryView: View {
    var model: Model
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.system(size: 12, weight: .regular)) // TODO: replace by Font extension
                Spacer()
                Text(model.value.toString())
                    .font(.system(size: 16, weight: .medium)) // TODO: replace by Font extension
                    .foregroundStyle(model.color)
            }
            .padding([.top, .bottom], 8)
            .padding(.leading, 12)
            Spacer()
            Image("link-circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .rotationEffect(model.iconAngelDegree)
                .frame(width: 48, height: 48)
                .foregroundStyle(model.color.opacity(0.2))
                .offset(x: 11, y: 16)
        }
        .frame(height: 60)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(.borderStroke, lineWidth: 1)
        )
    }
}

#Preview {
    HStack {
        PeriodSummaryView(model: PeriodSummaryView.Model(
            type: .expenses,
            value: CurrencyValue(currency: .usd, value: 2369.77)
        ))
        PeriodSummaryView(model: PeriodSummaryView.Model(
            type: .incomes,
            value: CurrencyValue(currency: .usd, value: 3799.33)
        ))
    }
    .padding()
    .background(.figmaBackground)
}
