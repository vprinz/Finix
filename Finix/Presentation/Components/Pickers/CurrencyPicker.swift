// Created by Valerie N. Prinz on 04/12/2024.

import SwiftUI

extension CurrencyPicker {
    struct Model {
        let currencyIsoCode: String
        let disabled: Bool
        let showCurrecnyImage: Bool
        
        var backgroundColor: Color {
            disabled ? .customPrimary.opacity(0.1) : .foreground
        }
        
        init(
            currencyIsoCode: String,
            disabled: Bool = false,
            showCurrecnyImage: Bool = false
        ) {
            self.currencyIsoCode = currencyIsoCode
            self.disabled = disabled
            self.showCurrecnyImage = showCurrecnyImage
        }
    }
}

struct CurrencyPicker: View {
    let model: Model
    
    var body: some View {
        HStack(spacing: .zero) {
            if model.showCurrecnyImage {
                Image(model.currencyIsoCode)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding(.leading, 12)
            }
            
            Spacer()
            Text(model.currencyIsoCode)
                .font(.bodyTextNarrowRegular)
                .foregroundStyle(Color.textSecondary)
            Spacer()
            
            if !model.disabled {
                Image("chevron-bottom")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 7)
                    .foregroundStyle(Color.customPrimary)
                    .padding(.trailing, 15)
            }
        }
        .cardFrame(height: 48, backgroundColor: model.backgroundColor)
    }
}

#Preview {
    VStack {
        HStack(spacing: 5) {
            CurrencyPicker(
                model: .init(currencyIsoCode: "USD")
            )
            CurrencyPicker(
                model: .init(currencyIsoCode: "USD", disabled: true)
            )
        }
        HStack(spacing: 5) {
            CurrencyPicker(
                model: .init(
                    currencyIsoCode: "USD",
                    showCurrecnyImage: true
                )
            )
            CurrencyPicker(
                model: .init(
                    currencyIsoCode: "EUR",
                    disabled: true,
                    showCurrecnyImage: true
                )
            )
        }
    }
    .padding()
    .background(Color.finixBackground)
}
