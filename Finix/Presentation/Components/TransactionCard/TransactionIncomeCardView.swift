// Created by Valerie N. Prinz on 30/10/2024.

import SwiftUI

extension TransactionIncomeCardView {
    struct Model {
        let transactionName: String
        let amountWithCurrency: String
        let walletName: String
        let exchangedAmountWithCurrency: String?
        
        init(
            transactionName: String,
            amountWithCurrency: String,
            walletName: String,
            exchangedAmountWithCurrency: String? = nil
        ) {
            self.transactionName = transactionName
            self.amountWithCurrency = amountWithCurrency
            self.walletName = walletName
            self.exchangedAmountWithCurrency = exchangedAmountWithCurrency
        }
    }
}

struct TransactionIncomeCardView: View {
    let model: Model
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.finixGreen)
                    .opacity(0.2)
                Image("external-link-circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.finixGreen)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(model.transactionName)
                    .font(.bodyTextNarrowRegular)
                    .foregroundStyle(Color.textSecondary)
                HStack {
                    Text("incomeText")
                    Image("arrow-right")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 8, height: 8)
                    Text(model.walletName)
                }
                .font(.smallTextRegular)
                .foregroundStyle(Color.textTertiary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("+ \(model.amountWithCurrency)")
                    .font(.captionNarrowMedium)
                    .foregroundStyle(Color.success)
                if let exchangedAmount = model.exchangedAmountWithCurrency {
                    Text("+ \(exchangedAmount)")
                        .font(.smallTextRegular)
                        .foregroundStyle(Color.textTertiary)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
        .frame(maxHeight: 52)
    }
}

#Preview {
    VStack(spacing: 10) {
        TransactionIncomeCardView(
            model: TransactionIncomeCardView.Model(
                transactionName: "Salary",
                amountWithCurrency: "$25.00",
                walletName: "Cash"
            )
        )
        TransactionIncomeCardView(
            model: TransactionIncomeCardView.Model(
                transactionName: "Salary",
                amountWithCurrency: "$25.00",
                walletName: "Cash",
                exchangedAmountWithCurrency: "€22.00"
            )
        )
    }
}
