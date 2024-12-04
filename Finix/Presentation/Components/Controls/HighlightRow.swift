// Created by Valerie N. Prinz on 04/12/2024.

import SwiftUI

extension HighlightRow {
    class ViewModel: ObservableObject {
        @Published var isHighlighted: Bool
        
        var text: String {
            isHighlighted
            ? String(localized: "highlightedText")
            : String(localized: "notHighlightedText")
        }
        
        var iconName: String {
            isHighlighted ? "bookmark-filled" : "bookmark"
        }
        
        init(isHighlighted: Bool = false) {
            self.isHighlighted = isHighlighted
        }
        
    }
}

struct HighlightRow: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack(spacing: .zero) {
            Text(viewModel.text)
                .font(.bodyTextNarrowRegular)
                .foregroundStyle(Color.textSecondary)
            Spacer()
            Image(viewModel.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.customPrimary)
        }
        .onTapGesture {
            withAnimation {
                viewModel.isHighlighted.toggle()
            }
        }
    }
}

#Preview {
    VStack {
        HighlightRow(viewModel: .init())
    }
    .padding()
    .background(Color.finixBackground)
}
