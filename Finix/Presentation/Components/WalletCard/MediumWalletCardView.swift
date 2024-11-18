// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

extension MediumWalletCardView {
    class ViewModel: ObservableObject {
        enum State {
            case plain
            case selected
        }
        
        let walletName: String
        let walletBalance: String
        let styleColor: Color
        let currencyIsoCode: String
        
        var backgroundColor: Color {
            switch state {
            case .plain:
                Color.textWhite
            case .selected:
                styleColor
            }
        }
        
        var textColor: Color {
            switch state {
            case .plain:
                Color.textSecondary
            case .selected:
                Color.textWhite
            }
        }
        
        @Published var state: State = .plain
        
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

struct MediumWalletCardView: View {
    @StateObject var viewModel: ViewModel
    
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
                viewModel.state = viewModel.state == .plain ? .selected : .plain
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
    let modelUsd = MediumWalletCardView.ViewModel(
        walletName: "Cash",
        walletBalance: "$750",
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    let modelUsdEmpty = MediumWalletCardView.ViewModel(
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    
    let modelEur = MediumWalletCardView.ViewModel(
        walletName: "NeoBank",
        walletBalance: "€1 560",
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    let modelEurEmpty = MediumWalletCardView.ViewModel(
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    
    let modelRub = MediumWalletCardView.ViewModel(
        walletName: "Favourite Card",
        walletBalance: "₽350 059 865",
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    let modelRubEmpty = MediumWalletCardView.ViewModel(
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
    .frame(width: 800, height: 800)
    .background(Color.finixBackground)
}
