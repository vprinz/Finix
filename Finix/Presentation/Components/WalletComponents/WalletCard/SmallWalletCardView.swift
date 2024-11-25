// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

struct SmallWalletCardView: View {
    @StateObject var viewModel: WalletCardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            topLayer
            bottomLayer
        }
        .walletCardFrame(
            height: 60,
            backgroundColor: viewModel.backgroundColor,
            cornerRadius: 10,
            strokeColor: viewModel.styleColor
        )
        .onTapGesture {
            withAnimation {
                // TODO: controll by parent component
            }
        }
    }
    
    var topLayer: some View {
        Group {
            Text(viewModel.walletName)
                .padding(.top, 8)
            Text(viewModel.walletBalance)
                .padding(.top, 4)
        }
        .padding(.leading, 8)
        .font(.microTextMedium)
        .foregroundStyle(viewModel.textColor)
    }
    
    var bottomLayer: some View {
        HStack {
            Spacer()
            if viewModel.state == .plain {
                Text(viewModel.currencyIsoCode)
                    .font(.buttonMedium)
                    .foregroundStyle(viewModel.styleColor)
                    .padding(.trailing, 5)
                    .padding(.bottom, 1)
            } else {
                Image("check-circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundStyle(Color.textWhite)
                    .offset(x: 3, y: 1)
            }
        }
        .frame(height: 30)
    }
}

#Preview {
    let modelUsd = WalletCardViewModel(
        walletName: "Cash",
        walletBalance: "$750",
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    let modelUsdEmpty = WalletCardViewModel(
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    
    let modelEur = WalletCardViewModel(
        walletName: "NeoBank",
        walletBalance: "€1 560",
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    let modelEurEmpty = WalletCardViewModel(
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    
    let modelRub = WalletCardViewModel(
        walletName: "Favourite Card",
        walletBalance: "₽350 059 865",
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    let modelRubEmpty = WalletCardViewModel(
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    
    VStack {
        HStack {
            SmallWalletCardView(viewModel: modelUsd)
                .frame(width: 90)
            SmallWalletCardView(viewModel: modelUsdEmpty)
                .frame(width: 90)
        }
        HStack {
            SmallWalletCardView(viewModel: modelEur)
                .frame(width: 90)
            SmallWalletCardView(viewModel: modelEurEmpty)
                .frame(width: 90)
        }
        HStack {
            SmallWalletCardView(viewModel: modelRub)
                .frame(width: 90)
            SmallWalletCardView(viewModel: modelRubEmpty)
                .frame(width: 90)
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.finixBackground)
}
