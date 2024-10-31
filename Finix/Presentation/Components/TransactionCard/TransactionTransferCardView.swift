// Created by Valerie N. Prinz on 30/10/2024.

import SwiftUI

extension TransactionTransferCardView {
    struct Model: Identifiable {
        let id: UUID
        let transactionName: String
        let amountWithCurrency: String
        let fromWalletName: String
        let toWalletName: String
        let exchangedAmountWithCurrency: String?
        
        init(
            id: UUID = UUID(),
            transactionName: String,
            amountWithCurrency: String,
            fromWalletName: String,
            toWalletName: String,
            exchangedAmountWithCurrency: String? = nil
        ) {
            self.id = id
            self.transactionName = transactionName
            self.amountWithCurrency = amountWithCurrency
            self.fromWalletName = fromWalletName
            self.toWalletName = toWalletName
            self.exchangedAmountWithCurrency = exchangedAmountWithCurrency
        }
    }
}

struct TransactionTransferCardView: View {
    let model: Model
    
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(Color.finixPurple)
                    .opacity(0.2)
                Image("arrows-left-right")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 14, height: 14)
                    .foregroundStyle(Color.finixPurple)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(model.transactionName)
                    .font(.bodyTextNarrowRegular)
                    .foregroundStyle(Color.textSecondary)
                HStack {
                    Text(model.fromWalletName)
                    Image("arrow-right")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 8, height: 8)
                    Text(model.toWalletName)
                }
                .font(.smallTextRegular)
                .foregroundStyle(Color.textTertiary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(model.amountWithCurrency)
                    .font(.captionNarrowMedium)
                    .foregroundStyle(Color.textPrimary)
                if let exchangedAmount = model.exchangedAmountWithCurrency {
                    Text(exchangedAmount)
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
    let models: [TransactionTransferCardView.Model] = [
        TransactionTransferCardView.Model(
            transactionName: "Transfer",
            amountWithCurrency: "$25.00",
            fromWalletName: "Cash",
            toWalletName: "Neobank"
        ),
        TransactionTransferCardView.Model(
            transactionName: "Transfer",
            amountWithCurrency: "$25.00",
            fromWalletName: "Cash",
            toWalletName: "Neobank",
            exchangedAmountWithCurrency: "€22.00"
        )
    ]
    
    VStack {
        List(models) { model in
            TransactionTransferCardView(
                model: model)
            .background(Color.figmaBackground)
        }
        .frame(width: 361)
        .background(Color.green)
        .scrollContentBackground(.hidden)
    }
    .clipShape(.rect(cornerRadius: 12))
    .background(Color.figmaBackground)
}
