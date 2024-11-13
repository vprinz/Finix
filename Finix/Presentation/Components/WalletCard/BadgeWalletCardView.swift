// Created by Valerie N. Prinz on 31/10/2024.

import SwiftUI

extension BadgeWalletCardView {
    struct Model: Identifiable {
        let id: UUID = UUID()
        let currencyIsoCode: String
        let styleColor: Color
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
                    .padding(.trailing, 6)
            }
        }
        .frame(height: 40)
        .background(Color.foreground)
        .clipShape(.rect(cornerRadius: 6))
        .overlay(
          RoundedRectangle(cornerRadius: 6)
            .inset(by: 0.25)
            .stroke(model.styleColor, lineWidth: 0.5)
        )
    }
}

#Preview {
    let models: [BadgeWalletCardView.Model] = [
        BadgeWalletCardView.Model(
            currencyIsoCode: "USD",
            styleColor: Color.lavender
        ),
        BadgeWalletCardView.Model(
            currencyIsoCode: "EUR",
            styleColor: Color.ocean
        ),
        BadgeWalletCardView.Model(
            currencyIsoCode: "RUB",
            styleColor: Color.rose
        )
    ]
    HStack {
        ForEach(models) { model in
            BadgeWalletCardView(model: model)
                .frame(width: 60)
        }
        .scrollContentBackground(.hidden)
    }
    .frame(width: 400, height: 400)
    .background(Color.figmaBackground)
}
