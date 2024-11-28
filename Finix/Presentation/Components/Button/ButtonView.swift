// Created by Valerie N. Prinz on 21/11/2024.

import SwiftUI

extension ButtonView {
    struct Model {
        enum Size {
            case small, big
        }
        
        enum Style {
            case primary, primaryOutlined, dark, secondary, plain
        }
        
        let size: Size
        let style: Style
        let buttonText: String
        let disabled: Bool
        let iconNameLeft: String?
        let iconNameRight: String?
        let action: () -> Void
        
        var textColor: Color {
            if disabled {
                return Color.textDisabled
            }
            switch style {
            case .primary:
                return Color.textWhite
            case .primaryOutlined:
                return Color.customPrimary
            case .dark:
                return Color.textSecondary
            default:
                return Color.textTertiary
            }
        }
        
        var textFont: Font {
            switch size {
            case .small: .bodyTextNarrowRegular
            case .big: .buttonLargeRegular
            }
        }
        
        var backgroundColor: Color {
            if disabled {
                return style == .plain ? .clear : .disabledBackground
            }
            switch style {
            case .primary:
                return Color.customPrimary
            case .plain:
                return Color.clear
            default:
                return Color.foreground
            }
        }
        
        var borderColor: Color {
            if disabled {
                return Color.clear
            }
            switch style {
            case .primary, .primaryOutlined:
                return Color.customPrimary
            case .dark, .secondary:
                return Color.borderStroke
            case .plain:
                return Color.clear
            }
        }
        
        var iconColor: Color {
            if disabled {
                return Color.textDisabled
            }
            switch style {
            case .primary:
                return Color.textWhite
            default:
                return Color.customPrimary
            }
        }
        
        var height: CGFloat {
            switch size {
            case .small: 34
            case .big: 48
            }
        }
        
        var cornerRadius: CGFloat {
            switch size {
            case .small: 10
            case .big: 12
            }
        }
        
        var iconSize: CGFloat {
            switch size {
            case .small: 10
            case .big: 16
            }
        }
        
        init(
            size: Size,
            style: Style,
            buttonText: String = "Button",
            disabled: Bool = false,
            iconNameLeft: String? = nil,
            iconNameRight: String? = nil,
            action: @escaping () -> Void
        ) {
            self.size = size
            self.style = style
            self.buttonText = buttonText
            self.disabled = disabled
            self.iconNameLeft = iconNameLeft
            self.iconNameRight = iconNameRight
            self.action = action
        }
    }
}

struct ButtonView: View {
    let model: Model
    
    var body: some View {
        Button {
            model.action()
        } label: {
            HStack(spacing: 0) {
                Spacer()
                icon(iconName: model.iconNameLeft)
                    .padding(.trailing, 8)
                Text(model.buttonText)
                    .font(model.textFont)
                    .foregroundStyle(model.textColor)
                icon(iconName: model.iconNameRight)
                    .padding(.leading, 8)
                Spacer()
            }
            .cardFrame(
                height: model.height,
                backgroundColor: model.backgroundColor,
                cornerRadius: model.cornerRadius,
                strokeColor: model.borderColor
            )
        }
        .disabled(model.disabled)
    }
    
    @ViewBuilder
    func icon(iconName: String?) -> some View {
        if let iconName = iconName {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(
                    width: model.iconSize,
                    height: model.iconSize
                )
                .foregroundStyle(model.iconColor)
        }
    }
}

#Preview {
    // Big button models without icon
    let bigButtonPrimary = ButtonView.Model(
        size: .big,
        style: .primary) {
            
        }
    let bigButtonPrimaryOutlined = ButtonView.Model(
        size: .big,
        style: .primaryOutlined) {
            
        }
    let bigButtonDisabled = ButtonView.Model(
        size: .big,
        style: .primary,
        disabled: true) {
            
        }
    
    // Big button models with icon
    let bigButtonPrimaryWithIcon = ButtonView.Model(
        size: .big,
        style: .primary,
        iconNameRight: "check-mark") {
            
        }
    let bigButtonPrimaryOutlinedWithIcon = ButtonView.Model(
        size: .big,
        style: .primaryOutlined,
        iconNameRight: "check-mark") {
            
        }
    let bigButtonDisabledWithIcon = ButtonView.Model(
        size: .big,
        style: .primary,
        disabled: true,
        iconNameRight: "check-mark") {
            
        }
    
    // Small button models without icon
    let smallButtonPrimary = ButtonView.Model(
        size: .small,
        style: .primary) {
            
        }
    let smallButtonPrimaryOutlined = ButtonView.Model(
        size: .small,
        style: .primaryOutlined) {
            
        }
    let smallButtonDisabled = ButtonView.Model(
        size: .small,
        style: .primary,
        disabled: true) {
            
        }
    
    // Small button models with icon
    let smallButtonPrimaryWithIcon = ButtonView.Model(
        size: .small,
        style: .primary,
        iconNameRight: "check-mark") {
            
        }
    let smallButtonPrimaryOutlinedWithIcon = ButtonView.Model(
        size: .small,
        style: .primaryOutlined,
        iconNameRight: "check-mark") {
            
        }
    let smallButtonDisabledWithIcon = ButtonView.Model(
        size: .small,
        style: .primary,
        disabled: true,
        iconNameRight: "check-mark") {
            
        }
    
    // Small button models with icon
    let smallButtonDarkWithIcon = ButtonView.Model(
        size: .small,
        style: .dark,
        iconNameLeft: "circle-plus") {
            
        }
    let smallButtonSecondaryWithIcon = ButtonView.Model(
        size: .small,
        style: .secondary,
        iconNameLeft: "circle-plus") {
            
        }
    let smallButtonPlainWithIcon = ButtonView.Model(
        size: .small,
        style: .plain,
        iconNameLeft: "circle-plus") {
            
        }
    let smallButtonPlainWithIconDisabled = ButtonView.Model(
        size: .small,
        style: .plain,
        disabled: true,
        iconNameLeft: "circle-plus") {
            
        }
    
    VStack(spacing: 20) {
        HStack(spacing: 5) {
            // Big buttons without icon
            VStack {
                ButtonView(model: bigButtonPrimary)
                ButtonView(model: bigButtonPrimaryOutlined)
                ButtonView(model: bigButtonDisabled)
            }
            // Big buttons with icon
            VStack {
                ButtonView(model: bigButtonPrimaryWithIcon)
                ButtonView(model: bigButtonPrimaryOutlinedWithIcon)
                ButtonView(model: bigButtonDisabledWithIcon)
            }
        }
        HStack(spacing: 5) {
            // Small buttons without icon
            VStack {
                ButtonView(model: smallButtonPrimary)
                ButtonView(model: smallButtonPrimaryOutlined)
                ButtonView(model: smallButtonDisabled)
            }
            // Small buttons with icon
            VStack {
                ButtonView(model: smallButtonPrimaryWithIcon)
                ButtonView(model: smallButtonPrimaryOutlinedWithIcon)
                ButtonView(model: smallButtonDisabledWithIcon)
            }
        }
        HStack(spacing: 5) {
            // Small buttons with left icon
            VStack {
                ButtonView(model: smallButtonDarkWithIcon)
                ButtonView(model: smallButtonSecondaryWithIcon)
                ButtonView(model: smallButtonPlainWithIcon)
                ButtonView(model: smallButtonPlainWithIconDisabled)
            }
        }
    }
    .padding()
    .background(Color.finixBackground)
}
