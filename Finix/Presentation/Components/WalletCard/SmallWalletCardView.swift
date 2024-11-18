// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

extension SmallWalletCardView {
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

struct SmallWalletCardView: View {
    @StateObject var viewModel: ViewModel
    
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
                viewModel.state = viewModel.state == .plain ? .selected : .plain
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
    let modelUsd = SmallWalletCardView.ViewModel(
        walletName: "Cash",
        walletBalance: "$750",
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    let modelUsdEmpty = SmallWalletCardView.ViewModel(
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    
    let modelEur = SmallWalletCardView.ViewModel(
        walletName: "NeoBank",
        walletBalance: "€1 560",
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    let modelEurEmpty = SmallWalletCardView.ViewModel(
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    
    let modelRub = SmallWalletCardView.ViewModel(
        walletName: "Favourite Card",
        walletBalance: "₽350 059 865",
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    let modelRubEmpty = SmallWalletCardView.ViewModel(
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
}
