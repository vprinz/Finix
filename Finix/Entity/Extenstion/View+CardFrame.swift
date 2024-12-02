// Created by Igor Uglev on 17.11.24.

import SwiftUI

struct CardFrameWrapper: ViewModifier {
    let width: CGFloat?
    let height: CGFloat?
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let strokeColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
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
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        backgroundColor: Color = Color.foreground,
        cornerRadius: CGFloat = 12,
        strokeColor: Color = Color.borderStroke
    ) -> some View {
        modifier(CardFrameWrapper(
            width: width,
            height: height,
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            strokeColor: strokeColor)
        )
    }
}
