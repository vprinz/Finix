// Created by Valerie N. Prinz on 31/10/2024.

import SwiftUI

extension SmallWalletCardView {
    struct Model: Identifiable {
        let id: UUID = UUID()
        let currencyIsoCode: String
        let style: Color
    }
}

struct SmallWalletCardView: View {
    let model: Model
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(model.currencyIsoCode)
                    .font(.titleSmall)
                    .foregroundStyle(model.style)
                    .padding(.trailing, 6)
            }
        }
        .frame(height: 40)
        .background(Color.foreground)
        .clipShape(.rect(cornerRadius: 6))
        .overlay(
          RoundedRectangle(cornerRadius: 6)
            .inset(by: 0.25)
            .stroke(model.style, lineWidth: 0.5)
        )
    }
}

#Preview {
    let models: [SmallWalletCardView.Model] = [
        SmallWalletCardView.Model(
            currencyIsoCode: "USD",
            style: Color.lavender
        ),
        SmallWalletCardView.Model(
            currencyIsoCode: "EUR",
            style: Color.ocean
        ),
        SmallWalletCardView.Model(
            currencyIsoCode: "RUB",
            style: Color.rose
        )
    ]
    HStack {
        ForEach(models) { model in
            SmallWalletCardView(model: model)
                .frame(width: 60)
        }
        .scrollContentBackground(.hidden)
    }
    .frame(width: 400, height: 400)
    .background(Color.figmaBackground)
}
