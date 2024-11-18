// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

extension SmallWalletCardView {
    struct Model {
        let walletName: String
        let walletBalance: String
        let styleColor: Color
        let currencyIsoCode: String
        
        init(
            walletName: String = "",
            walletBalance: String = "",
            styleColor: Color,
            currencyIsoCode: String
        ) {
            self.walletName = walletName
            self.walletBalance = walletBalance
            self.styleColor = styleColor
            self.currencyIsoCode = currencyIsoCode
        }
    }
}

struct SmallWalletCardView: View {
    let model: Model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                Text(model.walletName)
                    .padding(.top, 8)
                Text(model.walletBalance)
                    .padding(.top, 4)
            }
            .padding(.leading, 8)
            .font(.microTextMedium)
            .foregroundStyle(Color.textSecondary)
            HStack {
                Spacer()
                Text(model.currencyIsoCode)
                    .font(.buttonMedium)
                    .foregroundStyle(model.styleColor)
                    .padding(.trailing, 5)
                    .padding(.bottom, 1)
//                Image("check-circle")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 30)
//                    .offset(x: 3, y: 1)
                
            }
            .frame(height: 30)
        }
        .walletCardFrame(
            height: 60,
            backgroundColor: Color.textWhite,
            cornerRadius: 10,
            strokeColor: model.styleColor
        )
    }
}

#Preview {
    let modelUsd = SmallWalletCardView.Model(
        walletName: "Cash",
        walletBalance: "$750",
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    let modelUsdEmpty = SmallWalletCardView.Model(
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    
    let modelEur = SmallWalletCardView.Model(
        walletName: "NeoBank",
        walletBalance: "€1 560",
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    let modelEurEmpty = SmallWalletCardView.Model(
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    
    let modelRub = SmallWalletCardView.Model(
        walletName: "Favourite Card",
        walletBalance: "₽350 059 865",
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    let modelRubEmpty = SmallWalletCardView.Model(
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    
    VStack {
        HStack {
            SmallWalletCardView(model: modelUsd)
                .frame(width: 90)
            SmallWalletCardView(model: modelUsdEmpty)
                .frame(width: 90)
        }
        HStack {
            SmallWalletCardView(model: modelEur)
                .frame(width: 90)
            SmallWalletCardView(model: modelEurEmpty)
                .frame(width: 90)
        }
        HStack {
            SmallWalletCardView(model: modelRub)
                .frame(width: 90)
            SmallWalletCardView(model: modelRubEmpty)
                .frame(width: 90)
        }
    }
}
