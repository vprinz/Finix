// Created by Igor Uglev on 17.11.24.

import SwiftUI

struct CardFrameWrapper: ViewModifier {
    let height: CGFloat?
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let strokeColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(height: height)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: cornerRadius))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                .inset(by: 0.25)
                .stroke(strokeColor, lineWidth: 0.5)
            )
    }
}

extension View {
    func cardFrame(
        height: CGFloat? = nil,
        backgroundColor: Color,
        cornerRadius: CGFloat,
        strokeColor: Color
    ) -> some View {
        modifier(CardFrameWrapper(
            height: height,
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            strokeColor: strokeColor)
        )
    }
}
