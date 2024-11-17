// Created by Igor Uglev on 17.11.24.

import SwiftUI

struct CardWrapper: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(.white)
            .cornerRadius(12)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.25)
                    .stroke(Color.borderStroke, lineWidth: 0.5)
            )
    }
}

extension View {
    func card() -> some View {
        modifier(CardWrapper())
    }
}
