// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

extension LargeWalletCardView {
    struct Model {
        let walletName: String
        let walletBalance: String
        let styleColor: Color
        let currencyIsoCode: String
    }
}

struct LargeWalletCardView: View {
    let model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Text(model.walletName)
                Text(model.walletBalance)
            }
            .font(.titleSmall)
            .padding(.top, 16)
            .padding(.leading, 16)
            Spacer()
            HStack {
                Spacer()
                Text(model.currencyIsoCode)
                    .font(.titleLargeSemibold)
                    .padding(.trailing, 8)
            }
        }
        .foregroundStyle(Color.textWhite)
        .cardFrame(
            width: 280, height: 160,
            backgroundColor: model.styleColor,
            cornerRadius: 20, strokeColor: model.styleColor
        )
    }
}

#Preview {
    let modelUsd = LargeWalletCardView.Model(
        walletName: "Cash",
        walletBalance: "$750",
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    let modelEur = LargeWalletCardView.Model(
        walletName: "NeoBank",
        walletBalance: "€1 560",
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    let modelRub = LargeWalletCardView.Model(
        walletName: "Favourite Card",
        walletBalance: "₽350 059 865",
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    
    VStack {
        LargeWalletCardView(model: modelUsd)
        LargeWalletCardView(model: modelEur)
        LargeWalletCardView(model: modelRub)
    }
    .padding()
    .background(Color.finixBackground)
}
