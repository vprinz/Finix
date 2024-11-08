// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension EmptyStateView {
    struct Model {
        struct ButtonConfiguration {
            let text: String
            let action: () -> Void
        }
        
        enum State {
            case emptyTransaction
            case emptyLimit
        }
        
        var state: State = .emptyTransaction
        
        var imageName: String {
            switch state {
            case .emptyTransaction:
                return "calendar"
            case .emptyLimit:
                return "goal"
            }
        }
        
        var text: String {
            switch state {
            case .emptyTransaction:
                String(localized: "emptyTransactionText")
            case .emptyLimit:
                String(localized: "emptyLimitText")
            }
        }
        
        var buttonConfig: ButtonConfiguration {
            switch state {
            case .emptyTransaction:
                return .init(
                    text: String(localized: "addTransactionBtnText")) {
                        // Add logic here
                    }
            case .emptyLimit:
                return .init(
                    text: String(localized: "setLimitBtnText")) {
                        // Add logic here
                    }
            }
        }
    }
}

struct EmptyStateView: View {
    let model: Model
    
    var body: some View {
        HStack {
            Image(model.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 105)
                .padding(.trailing, 30)
            VStack(alignment: .leading) {
                Text(model.text)
                    .font(.smallTextTallRegular)
                    .foregroundStyle(Color.textSecondary)
                    .padding(.bottom, 22)
                Button {
                    model.buttonConfig.action()
                } label: {
                    HStack(alignment: .center) {
                        Text(model.buttonConfig.text)
                            .font(.bodyTextNarrowRegular)
                            .foregroundStyle(Color.customPrimary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .overlay(
                      RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(Color.customPrimary)
                    )
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.5)
        }
        .padding(16)
        .frame(minHeight: 152)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .inset(by: 0.25)
            .stroke(Color.borderStroke, lineWidth: 0.5)
        )
    }
}

#Preview {
    let model1: EmptyStateView.Model = EmptyStateView.Model(
        state: .emptyTransaction
    )
    let model2: EmptyStateView.Model = EmptyStateView.Model(
        state: .emptyLimit
    )
    
    VStack {
        EmptyStateView(model: model1)
            .frame(maxWidth: 360)
        EmptyStateView(model: model2)
            .frame(maxWidth: 360)
    }
    .frame(width: 600, height: 600)
    .background(Color.figmaBackground)
}
