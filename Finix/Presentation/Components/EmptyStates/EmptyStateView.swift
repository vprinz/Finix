// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension EmptyStateView {
    struct Model {
        struct ButtonConfiguration {
            let text: String
            let action: () -> Void
        }
        
        enum State {
            case upcomingTransaction
            case recentTransaction
            case limit
        }
        
        var state: State
        let btnAction: () -> Void
        
        var imageName: String {
            switch state {
            case .upcomingTransaction: "shopping-bag"
            case .recentTransaction: "calendar"
            case .limit: "target"
            }
        }
        
        var text: String {
            switch state {
            case .upcomingTransaction:
                String(localized: "emptyUpcomingTransactionText")
            case .recentTransaction:
                String(localized: "emptyRecentTransactionText")
            case .limit:
                String(localized: "emptyLimitText")
            }
        }
        
        var buttonConfig: ButtonConfiguration {
            switch state {
            case .upcomingTransaction:
                return .init(
                    text: String(localized: "addTransactionBtnText"),
                    action: btnAction
                )
            case .recentTransaction:
                return .init(
                    text: String(localized: "addTransactionBtnText"),
                    action: btnAction
                )
            case .limit:
                return .init(
                    text: String(localized: "setLimitBtnText"),
                    action: btnAction
                )
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
                .frame(width: 120, height: 80)
            VStack(alignment: .leading) {
                Text(model.text)
                    .font(.smallTextTallRegular)
                    .foregroundStyle(Color.textSecondary)
                    .padding(.bottom, 8)
                Button {
                    model.buttonConfig.action()
                } label: {
                    HStack(alignment: .center) {
                        Text(model.buttonConfig.text)
                            .font(.bodyTextNarrowRegular)
                            .foregroundStyle(Color.customPrimary)
                    }
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
            .padding(.horizontal, 16)
            Spacer()
        }
        .walletCardFrame(
            height: 125,
            backgroundColor: Color.foreground,
            cornerRadius: 12,
            strokeColor: Color.borderStroke
        )
    }
}

#Preview {
    let model1: EmptyStateView.Model = EmptyStateView.Model(
        state: .upcomingTransaction) {
            print("Empty State of Upcoming Transaction")
        }
    let model2: EmptyStateView.Model = EmptyStateView.Model(
        state: .recentTransaction) {
            print("Empty State of Recent Transaction")
        }
    let model3: EmptyStateView.Model = EmptyStateView.Model(
        state: .limit) {
            print("Empty State of Limit")
        }
    
    VStack {
        EmptyStateView(model: model1)
            .frame(maxWidth: 360)
        EmptyStateView(model: model2)
            .frame(maxWidth: 360)
        EmptyStateView(model: model3)
            .frame(maxWidth: 360)
    }
    .frame(width: 600, height: 600)
    .background(Color.finixBackground)
}
