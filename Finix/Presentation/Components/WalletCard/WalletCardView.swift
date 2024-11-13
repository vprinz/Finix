// Created by Valerie N. Prinz on 11/11/2024.

import SwiftUI

extension WalletCardView {
    struct Model {
        enum Size {
            case extraSmall
            case small
            case medium
            case large
        }
        
        struct AmountLayerStyle {
            let font: Font
            let color: Color
            let padding: EdgeInsets
            let spacing: CGFloat
        }
        
        struct LabelLayerStyle {
            let font: Font
            let color: Color
            let padding: EdgeInsets
        }
        
        let size: Size
        let styleColor: Color
        let walletName: String?
        let totalAmountWithCurrency: String?
        let currencyIsoCode: String
        
        var amountLayerStyle: AmountLayerStyle {
            .init(
                font: {
                    switch size {
                    case .extraSmall, .small: .microTextMedium
                    case .medium: .helperTextMedium
                    case .large: .titleSmall
                    }
                }(),
                color: {
                    switch size {
                    case .large: Color.textWhite
                    default: Color.textSecondary
                    }
                }(),
                padding: {
                    switch size {
                    case .extraSmall:
                        .init(top: 0, leading: 0, bottom: 0, trailing: 0)
                    case .small:
                        .init(top: 8, leading: 8, bottom: 0, trailing: 0)
                    case .medium:
                        .init(top: 8, leading: 10, bottom: 0, trailing: 0)
                    case .large:
                        .init(top: 16, leading: 16, bottom: 0, trailing: 0)
                    }
                }(),
                spacing:  {
                    switch size {
                    case .extraSmall: 0
                    case .small: 4
                    case .medium: 8
                    case .large: 16
                    }
                }()
            )
        }
        
        var labelLayerStyle: LabelLayerStyle {
            .init(
                font: {
                    switch size {
                    case .extraSmall: .titleSmall
                    case .small: .buttonMedium
                    case .medium: .titleMedium
                    case .large: .titleLargeSemibold
                    }
                }(),
                color: {
                    switch size {
                    case .large: Color.textWhite
                    default: styleColor
                    }
                }(),
                padding: {
                    switch size {
                    case .extraSmall:
                        .init(top: 0, leading: 0, bottom: 0, trailing: 4)
                    case .small:
                        .init(top: 0, leading: 0, bottom: 5, trailing: 5)
                    case .medium:
                        .init(top: 0, leading: 0, bottom: 1, trailing: 7)
                    case .large:
                        .init(top: 0, leading: 0, bottom: 0, trailing: 8)
                    }
                }()
            )
        }
        
        var backgroundColor: Color {
            switch size {
            case .large: styleColor
            default: Color.foreground
            }
        }
        
        var borderColor: Color {
            switch size {
            case .extraSmall, .small: styleColor
            case .medium, .large: Color.clear
            }
        }
        
        var height: CGFloat {
            switch size {
            case .extraSmall: 40
            case .small: 60
            case .medium: 88
            case .large: 160
            }
        }
        
        var cornerRadius: CGFloat {
            switch size {
            case .extraSmall: 6
            case .small: 10
            case .medium: 12
            case .large: 20
            }
        }
        
        init(
            size: Size,
            styleColor: Color,
            walletName: String? = nil,
            totalAmountWithCurrency: String? = nil,
            currencyIsoCode: String
        ) {
            self.size = size
            self.styleColor = styleColor
            self.walletName = walletName
            self.totalAmountWithCurrency = totalAmountWithCurrency
            self.currencyIsoCode = currencyIsoCode
        }
        
    }
}

struct WalletCardView: View {
    let model: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            if let walletName = model.walletName,
               let totalAmount = model.totalAmountWithCurrency {
                VStack(alignment: .leading, spacing: model.amountLayerStyle.spacing) {
                    Text(walletName)
                    Text(totalAmount)
                }
                .font(model.amountLayerStyle.font)
                .foregroundStyle(model.amountLayerStyle.color)
                .padding(model.amountLayerStyle.padding)
            }
            Spacer()
            HStack {
                Spacer()
                Text(model.currencyIsoCode)
                    .font(model.labelLayerStyle.font)
                    .foregroundStyle(model.labelLayerStyle.color)
            }
            .padding(model.labelLayerStyle.padding)
        }
        .frame(height: model.height)
        .background(model.backgroundColor)
        .clipShape(.rect(cornerRadius: model.cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: model.cornerRadius)
            .inset(by: 0.25)
            .stroke(model.borderColor, lineWidth: 0.5)
        )
    }
}

#Preview {
    let model1usd = WalletCardView.Model(
        size: .extraSmall,
        styleColor: Color.customPrimary,
        currencyIsoCode: "USD"
    )
    let model1eur = WalletCardView.Model(
        size: .extraSmall,
        styleColor: Color.ocean,
        currencyIsoCode: "EUR"
    )
    
    let model1rub = WalletCardView.Model(
        size: .extraSmall,
        styleColor: Color.rose,
        currencyIsoCode: "RUB"
    )
    
    let model2usd = WalletCardView.Model(
        size: .small,
        styleColor: Color.customPrimary,
        walletName: "Cash",
        totalAmountWithCurrency: "$750",
        currencyIsoCode: "USD"
    )
    let model2eur = WalletCardView.Model(
        size: .small,
        styleColor: Color.ocean,
        walletName: "NeoBank",
        totalAmountWithCurrency: "€1 560",
        currencyIsoCode: "EUR"
    )
    let model2rub = WalletCardView.Model(
        size: .small,
        styleColor: Color.rose,
        walletName: "Favourite Card",
        totalAmountWithCurrency: "₽350 059 865",
        currencyIsoCode: "RUB"
    )
    
    let model3usd = WalletCardView.Model(
        size: .medium,
        styleColor: Color.customPrimary,
        walletName: "Cash",
        totalAmountWithCurrency: "$750",
        currencyIsoCode: "USD"
    )
    let model3rub = WalletCardView.Model(
        size: .medium,
        styleColor: Color.rose,
        walletName: "Favourite Card",
        totalAmountWithCurrency: "₽350 059 865",
        currencyIsoCode: "RUB"
    )
    
    let model4 = WalletCardView.Model(
        size: .large,
        styleColor: Color.customPrimary,
        walletName: "Cash",
        totalAmountWithCurrency: "$750",
        currencyIsoCode: "USD"
    )
    
    VStack(alignment: .leading) {
        HStack {
            WalletCardView(model: model1usd)
                .frame(width: 60)
            WalletCardView(model: model1eur)
                .frame(width: 60)
            WalletCardView(model: model1rub)
                .frame(width: 60)
        }
        HStack {
            WalletCardView(model: model2usd)
                .frame(width: 90)
            WalletCardView(model: model2eur)
                .frame(width: 90)
            WalletCardView(model: model2rub)
                .frame(width: 90)
        }
        HStack {
            WalletCardView(model: model3usd)
                .frame(width: 132)
            WalletCardView(model: model3rub)
                .frame(width: 132)
        }
        WalletCardView(model: model4)
            .frame(width: 280)
    }
    .frame(width: 800, height: 800)
    .background(Color.figmaBackground)
}
