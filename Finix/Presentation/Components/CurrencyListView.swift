// Created by Valerie N. Prinz on 25/11/2024.

import SwiftUI

extension CurrencyListView {
    class ViewModel: ObservableObject {
        @Published var selectedCurency: Currency?
        var currencies: [Currency] = Currency.allCases
    }
}

struct CurrencyListView: View {
    let viewModel: ViewModel
    
    var body: some View {
        ForEach(viewModel.currencies) { currency in
            HStack(spacing: 0) {
                Image(currency.isoCode)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Group {
                    Text(currency.fullName ?? "")
                    Text("(\(currency.isoCode))")
                }
                .foregroundStyle(Color.textSecondary)
                .font(.bodyTextNarrowRegular)
                .padding(.leading, 8)
                Spacer()
                RadioButtonView(model: .init())
                    .padding(.trailing, 10)
            }
            .padding(.vertical, 8)
            .padding(.leading, 20)
            .padding(.trailing, 12)
        }
    }
}

#Preview {
    ScrollView {
        CurrencyListView(viewModel: .init())
    }
    .scrollIndicators(.hidden)
    .padding()
}
