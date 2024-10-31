// Created by Valerie N. Prinz on 31/10/2024.

import SwiftUI

extension WalletCardView {
    struct Model: Identifiable {
        let id: UUID
        let walletName: String?
        let totalAmountWithCurrency: String?
        let currencyIsoCode: String
        let style: Color
        
        init(
            id: UUID = UUID(),
            walletName: String? = nil,
            totalAmountWithCurrency: String? = nil,
            currencyIsoCode: String,
            style: Color
        ) {
            self.id = id
            self.walletName = walletName
            self.totalAmountWithCurrency = totalAmountWithCurrency
            self.currencyIsoCode = currencyIsoCode
            self.style = style
        }
    }
}

struct WalletCardView: View {
    let model: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            if let walletName = model.walletName,
               let totalAmount = model.totalAmountWithCurrency {
                VStack(alignment: .leading) {
                    Text(walletName)
                    Text(totalAmount)
                }
                .font(.microTextMedium)
                .foregroundStyle(Color.textSecondary)
                .padding(.top, 8)
                .padding(.leading, 8)
            }
            Spacer()
            HStack {
                Spacer()
                Text(model.currencyIsoCode)
                    .font(.titleSmall)
                    .foregroundStyle(model.style)
                    .padding(.trailing, 8)
                    .padding(.bottom, 4)
            }
            
        }
        .frame(height: 60)
        .background(Color.foreground)
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .inset(by: 0.25)
            .stroke(model.style, lineWidth: 0.5)
        )
    }
}

#Preview {
    let models1: [WalletCardView.Model] = [
        WalletCardView.Model(
            walletName: "Cash",
            totalAmountWithCurrency: "$750",
            currencyIsoCode: "USD",
            style: Color.lavender
        ),
        WalletCardView.Model(
            walletName: "NeoBank",
            totalAmountWithCurrency: "€1 560",
            currencyIsoCode: "EUR",
            style: Color.ocean
        ),
        WalletCardView.Model(
            walletName: "Favourite Card",
            totalAmountWithCurrency: "₽350 059 865",
            currencyIsoCode: "RUB",
            style: Color.rose
        )
    ]
    
    let models2: [WalletCardView.Model] = [
        WalletCardView.Model(
            currencyIsoCode: "USD",
            style: Color.lavender
        ),
        WalletCardView.Model(
            currencyIsoCode: "EUR",
            style: Color.ocean
        ),
        WalletCardView.Model(
            currencyIsoCode: "RUB",
            style: Color.rose
        )
    ]
    
    VStack {
        HStack {
            ForEach(models1) { model in
                WalletCardView(model: model)
                    .frame(width: 90)
            }
        }
        HStack {
            ForEach(models2) { model in
                WalletCardView(model: model)
                    .frame(width: 90)
            }
        }
    }
    .frame(width: 400, height: 400)
    .background(Color.figmaBackground)
}
