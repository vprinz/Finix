// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

extension BadgeWalletCardView {
    struct Model {
        let styleColor: Color
        let currencyIsoCode: String
    }
}

struct BadgeWalletCardView: View {
    let model: Model
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(model.currencyIsoCode)
                    .font(.titleSmall)
                    .foregroundStyle(model.styleColor)
                    .padding(.trailing, 4)
            }
        }
        .walletCardFrame(
            height: 40,
            backgroundColor: Color.textWhite,
            cornerRadius: 6, strokeColor: model.styleColor
        )
    }
}

#Preview {
    let modelUsd = BadgeWalletCardView.Model(
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    let modelEur = BadgeWalletCardView.Model(
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    let modelRub = BadgeWalletCardView.Model(
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    
    HStack {
        Group {
            BadgeWalletCardView(model: modelUsd)
            BadgeWalletCardView(model: modelEur)
            BadgeWalletCardView(model: modelRub)
        }
        .frame(width: 60)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.finixBackground)
}
