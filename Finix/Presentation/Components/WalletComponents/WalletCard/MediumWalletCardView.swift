// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

struct MediumWalletCardView: View {
    @StateObject var viewModel: WalletCardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            topLayer
            bottomLayer
        }
        .walletCardFrame(
            height: 88,
            backgroundColor: viewModel.backgroundColor,
            cornerRadius: 12,
            strokeColor: Color.textWhite
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
                .padding(.top, 8)
        }
        .padding(.leading, 10)
        .font(.helperTextMedium)
        .foregroundStyle(viewModel.textColor)
    }
    
    var bottomLayer: some View {
        HStack {
            Spacer()
            if viewModel.state == .plain {
                Text(viewModel.currencyIsoCode)
                    .font(.titleMedium)
                    .foregroundStyle(viewModel.styleColor)
                    .padding(.trailing, 7)
                    .padding(.bottom, 1)
            } else {
                Image("check-circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    .foregroundStyle(Color.textWhite)
                    .offset(x: 6, y: 6)
            }
        }
        .frame(height: 40)
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
            MediumWalletCardView(viewModel: modelUsd)
                .frame(width: 132)
            MediumWalletCardView(viewModel: modelUsdEmpty)
                .frame(width: 132)
        }
        HStack {
            MediumWalletCardView(viewModel: modelEur)
                .frame(width: 132)
            MediumWalletCardView(viewModel: modelEurEmpty)
                .frame(width: 132)
        }
        HStack {
            MediumWalletCardView(viewModel: modelRub)
                .frame(width: 132)
            MediumWalletCardView(viewModel: modelRubEmpty)
                .frame(width: 132)
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.finixBackground)
}
