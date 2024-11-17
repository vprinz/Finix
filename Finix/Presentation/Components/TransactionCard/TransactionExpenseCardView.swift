// Created by Valerie N. Prinz on 30/10/2024.

import SwiftUI

extension TransactionExpenseCardView {
    struct Model: Identifiable {
        let id: UUID
        let categoryIconName: String
        let transactionName: String
        let amountWithCurrency: String
        
        let exchangedAmountWithCurrency: String?
        let categoryName: String?
        let walletName: String?
        
        init(
            id: UUID = UUID(),
            categoryIconName: String,
            transactionName: String,
            amountWithCurrency: String,
            exchangedAmountWithCurrency: String? = nil,
            categoryName: String? = nil,
            walletName: String? = nil
        ) {
            self.id = id
            self.categoryIconName = categoryIconName
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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.midnight)
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
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
        .frame(height: 52)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    let models: [TransactionExpenseCardView.Model] = [
        TransactionExpenseCardView.Model(
            categoryIconName: "bank",
            transactionName: "ATM",
            amountWithCurrency: "$25.00"
        ),
        TransactionExpenseCardView.Model(
            categoryIconName: "bank",
            transactionName: "ATM",
            amountWithCurrency: "$25.00",
            categoryName: "Banking",
            walletName: "Cash"
        ),
        TransactionExpenseCardView.Model(
            categoryIconName: "bank",
            transactionName: "ATM",
            amountWithCurrency: "$25.00",
            exchangedAmountWithCurrency: "€22.00"
        ),
        TransactionExpenseCardView.Model(
            categoryIconName: "bank",
            transactionName: "ATM",
            amountWithCurrency: "$25.00",
            exchangedAmountWithCurrency: "€22.00",
            categoryName: "Banking",
            walletName: "Cash"
        )
    ]
    
    VStack {
        List(models) { model in
            TransactionExpenseCardView(
                model: model)
            .background(Color.finixBackground)
        }
        .frame(width: 361)
        .background(Color.green)
        .scrollContentBackground(.hidden)
    }
    .clipShape(.rect(cornerRadius: 12))
    .background(Color.finixBackground)
}
