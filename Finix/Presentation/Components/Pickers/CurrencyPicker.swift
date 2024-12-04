// Created by Valerie N. Prinz on 04/12/2024.

import SwiftUI

extension CurrencyPicker {
    struct Model {
        let currency: Currency
        let disabled: Bool = false
        let showCurrecnyImage: Bool = false
        
        var backgroundColor: Color {
            disabled ? .customPrimary.opacity(0.1) : .foreground
        }
    }
}

struct CurrencyPicker: View {
    var body: some View {
        HStack(spacing: .zero) {
//            Image("USD")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 24, height: 24)
//                .padding(.leading, 12)
            Spacer()
            Text("USD")
                .font(.bodyTextNarrowRegular)
                .foregroundStyle(Color.textSecondary)
            Spacer()
            Image("chevron-bottom")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14, height: 7)
                .foregroundStyle(Color.customPrimary)
//                .padding(.leading, 20)
                .padding(.trailing, 15)
        }
        .padding(.vertical, 12)
        .cardFrame(height: 48)
    }
}

#Preview {
    HStack(spacing: 5) {
        CurrencyPicker()
    }
    .padding()
}
