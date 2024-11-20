// Created by Valerie N. Prinz on 30/10/2024.

import SwiftUI

extension TransactionExpenseCardView {
    struct Model: Identifiable {
        let id: UUID
        let categoryIconName: String
        let categoryIconColor: Color
        let transactionName: String
        let amountWithCurrency: String
        
        let exchangedAmountWithCurrency: String?
        let categoryName: String?
        let walletName: String?
        
        init(
            id: UUID = UUID(),
            categoryIconName: String,
            categoryIconColor: Color,
            transactionName: String,
            amountWithCurrency: String,
            exchangedAmountWithCurrency: String? = nil,
            categoryName: String? = nil,
            walletName: String? = nil
        ) {
            self.id = id
            self.categoryIconName = categoryIconName
            self.categoryIconColor = categoryIconColor
            self.transactionName = transactionName
            self.amountWithCurrency = amountWithCurrency
            self.exchangedAmountWithCurrency = exchangedAmountWithCurrency
            self.categoryName = categoryName
            self.walletName = walletName
        }
    }
}

struct TransactionExpenseCardView: View {
    let model: Model
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.finixLightGray)
                    .opacity(0.2)
                Image(model.categoryIconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundStyle(model.categoryIconColor)
            }
            VStack(alignment: .leading) {
                Text(model.transactionName)
                    .font(.bodyTextNarrowRegular)
                    .foregroundStyle(Color.textSecondary)
                if let categoryName = model.categoryName {
                    Text(categoryName)
                        .font(.smallTextRegular)
                        .foregroundStyle(Color.textTertiary)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("- \(model.amountWithCurrency)")
                    .font(.captionNarrowMedium)
                    .foregroundStyle(Color.textSecondary)
                Group {
                    if let exchangedAmount = model.exchangedAmountWithCurrency {
                        Text("- \(exchangedAmount)")
                    }
                    if let walletName = model.walletName {
                        Text(walletName)
                    }
                }
                .font(.smallTextRegular)
                .foregroundStyle(Color.textTertiary)
            }
        }
        .frame(height: 52)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    let models: [TransactionExpenseCardView.Model] = [
        TransactionExpenseCardView.Model(
            categoryIconName: "bank",
            categoryIconColor: Color.midnight,
            transactionName: "ATM",
            amountWithCurrency: "$25.00"
        ),
        TransactionExpenseCardView.Model(
            categoryIconName: "buildings",
            categoryIconColor: Color.customPrimary,
            transactionName: "Rent",
            amountWithCurrency: "$1 050.00",
            categoryName: "Housing",
            walletName: "Cash"
        ),
        TransactionExpenseCardView.Model(
            categoryIconName: "player",
            categoryIconColor: Color.aquamarine,
            transactionName: "Netflix",
            amountWithCurrency: "$18.99",
            exchangedAmountWithCurrency: "€22.00"
        ),
        TransactionExpenseCardView.Model(
            categoryIconName: "lamp",
            categoryIconColor: Color.finixYellow,
            transactionName: "Electicity",
            amountWithCurrency: "$40.00",
            exchangedAmountWithCurrency: "€38.00",
            categoryName: "Utilities",
            walletName: "Cash"
        )
    ]
    
    VStack {
        List(models) { model in
            TransactionExpenseCardView(model: model)
        }
        .listStyle(.plain)
    }
    .background(Color.finixBackground)
}
