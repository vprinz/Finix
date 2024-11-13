// Created by Valerie N. Prinz on 31/10/2024.

import SwiftUI

extension WalletCardViewExample {
    class ViewModel: ObservableObject, Identifiable {
        enum State {
            case inactive
            case focused
        }
        
        let id: UUID
        let walletName: String?
        let totalAmountWithCurrency: String?
        let currencyIsoCode: String
        let style: Color
        
        var backgroundColor: Color {
            switch state {
            case .inactive:
                Color.foreground
            case .focused:
                self.style
            }
        }
        
        var textColor: Color {
            switch state {
            case .inactive:
                Color.textSecondary
            case .focused:
                Color.textWhite
            }
        }
        
        @Published var state: State = .inactive
        
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

struct WalletCardViewExample: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(viewModel.walletName ?? "")
                Text(viewModel.totalAmountWithCurrency ?? "")
            }
            .font(.microTextMedium)
            .foregroundStyle(viewModel.textColor)
            .padding(.top, 8)
            .padding(.leading, 8)
            HStack(alignment: .bottom) {
                Spacer()
                if viewModel.state == .inactive {
                    Text(viewModel.currencyIsoCode)
                        .font(.titleSmall)
                        .foregroundStyle(viewModel.style)
                        .padding(.trailing, 8)
                        .padding(.bottom, 4)
                } else {
                    Image("check-circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.textWhite)
                        .offset(x: 3, y: 0)
                }
            }
            
        }
        .frame(height: 60)
        .background(viewModel.backgroundColor)
        .clipShape(.rect(cornerRadius: 10))
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .inset(by: 0.25)
            .stroke(viewModel.style, lineWidth: 0.5)
        )
        .onTapGesture {
            withAnimation {
                viewModel.state = viewModel.state == .inactive ? .focused : .inactive
            }
        }
    }
}

#Preview {
    let models1: [WalletCardViewExample.ViewModel] = [
        WalletCardViewExample.ViewModel(
            walletName: "Cash",
            totalAmountWithCurrency: "$750",
            currencyIsoCode: "USD",
            style: Color.lavender
        ),
        WalletCardViewExample.ViewModel(
            walletName: "NeoBank",
            totalAmountWithCurrency: "€1 560",
            currencyIsoCode: "EUR",
            style: Color.ocean
        ),
        WalletCardViewExample.ViewModel(
            walletName: "Favourite Card",
            totalAmountWithCurrency: "₽350 059 865",
            currencyIsoCode: "RUB",
            style: Color.rose
        )
    ]
    
    let models2: [WalletCardViewExample.ViewModel] = [
        WalletCardViewExample.ViewModel(
            currencyIsoCode: "USD",
            style: Color.lavender
        ),
        WalletCardViewExample.ViewModel(
            currencyIsoCode: "EUR",
            style: Color.ocean
        ),
        WalletCardViewExample.ViewModel(
            currencyIsoCode: "RUB",
            style: Color.rose
        )
    ]
    
    VStack {
        HStack {
            ForEach(models1) { model in
                WalletCardViewExample(viewModel: model)
                    .frame(width: 90)
            }
        }
        HStack {
            ForEach(models2) { model in
                WalletCardViewExample(viewModel: model)
                    .frame(width: 90)
            }
        }
    }
    .frame(width: 400, height: 400)
    .background(Color.figmaBackground)
}
