// Created by Valerie N. Prinz on 21/11/2024.

import SwiftUI

extension ButtonView {
    struct Model {
        enum Size {
            case small, big
        }
        
        enum Style {
            case primary
            case primaryOutlined
            case dark
            case secondary
            case plain
            case disabled
        }
        
        let size: Size
        let style: Style
        let buttonText: String
        let iconNameLeft: String?
        let iconNameRight: String?
        let action: () -> Void
        
        var textColor: Color {
            switch style {
            case .primary: Color.textWhite
            case .primaryOutlined: Color.customPrimary
            case .dark: Color.textSecondary
            case .secondary: Color.textTertiary
            case .plain: Color.textTertiary
            case .disabled: Color.textDisabled
            }
        }
        
        var textFont: Font {
            switch size {
            case .small: .bodyTextNarrowRegular
            case .big: .buttonLargeRegular
            }
        }
        
        var backgroundColor: Color {
            switch style {
            case .primary: Color.customPrimary
            case .plain: Color.clear
            case .disabled: Color.disabledBackground
            default: Color.foreground
            }
        }
        
        var borderColor: Color {
            switch style {
            case .primary: Color.customPrimary
            case .primaryOutlined: Color.customPrimary
            case .dark: Color.borderStroke
            case .secondary: Color.borderStroke
            case .plain: Color.clear
            case .disabled: Color.clear
            }
        }
        
        var iconColor: Color {
            switch style {
            case .primary: Color.textWhite
            case .disabled: Color.textDisabled
            default: Color.customPrimary
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
            iconNameLeft: String? = nil,
            iconNameRight: String? = nil,
            action: @escaping () -> Void
        ) {
            self.size = size
            self.style = style
            self.buttonText = buttonText
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
            .walletCardFrame(
                height: model.height,
                backgroundColor: model.backgroundColor,
                cornerRadius: model.cornerRadius,
                strokeColor: model.borderColor
            )
        }
        .disabled(model.style == .disabled)
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
        style: .disabled) {
            
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
        style: .disabled,
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
        style: .disabled) {
            
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
        style: .disabled,
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
    
    VStack(spacing: 20) {
        HStack {
            // Big buttons without icon
            VStack {
                ButtonView(model: bigButtonPrimary)
                    .frame(width: 124)
                ButtonView(model: bigButtonPrimaryOutlined)
                    .frame(width: 124)
                ButtonView(model: bigButtonDisabled)
                    .frame(width: 124)
            }
            // Big buttons with icon
            VStack {
                ButtonView(model: bigButtonPrimaryWithIcon)
                    .frame(width: 124)
                ButtonView(model: bigButtonPrimaryOutlinedWithIcon)
                    .frame(width: 124)
                ButtonView(model: bigButtonDisabledWithIcon)
                    .frame(width: 124)
            }
        }
        HStack {
            // Small buttons without icon
            VStack {
                ButtonView(model: smallButtonPrimary)
                    .frame(width: 80)
                ButtonView(model: smallButtonPrimaryOutlined)
                    .frame(width: 80)
                ButtonView(model: smallButtonDisabled)
                    .frame(width: 80)
            }
            // Small buttons with icon
            VStack {
                ButtonView(model: smallButtonPrimaryWithIcon)
                    .frame(width: 100)
                ButtonView(model: smallButtonPrimaryOutlinedWithIcon)
                    .frame(width: 100)
                ButtonView(model: smallButtonDisabledWithIcon)
                    .frame(width: 100)
            }
        }
        HStack {
            // Small buttons with left icon
            VStack {
                ButtonView(model: smallButtonDarkWithIcon)
                    .frame(width: 100)
                ButtonView(model: smallButtonSecondaryWithIcon)
                    .frame(width: 100)
                ButtonView(model: smallButtonPlainWithIcon)
                    .frame(width: 100)
            }
        }
    }
    .frame(width: 800, height: 800)
    .background(Color.finixBackground)
}
