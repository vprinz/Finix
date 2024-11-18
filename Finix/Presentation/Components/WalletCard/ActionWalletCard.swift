// Created by Valerie N. Prinz on 13/11/2024.

import SwiftUI

extension ActionWalletCard {
    struct Model {
        enum Size {
            case small
            case medium
        }
        
        enum ActionType {
            case addAccount
            case seeAll
        }
        
        let size: Size
        let controlType: ActionType
        
        var actionName: String {
            switch controlType {
            case .addAccount:
                String(localized: "Add account")
            case .seeAll:
                String(localized: "Saa all")
            }
        }
        
        var iconName: String {
            switch controlType {
            case .addAccount: "plus-circle"
            case .seeAll: "arrow-right-circle"
            }
        }
        
        var height: CGFloat {
            switch size {
            case .small: 60
            case .medium: 88
            }
        }
        
        var cornerRadius: CGFloat {
            switch size {
            case .small: 10
            case .medium: 12
            }
        }
    }
}

struct ActionWalletCard: View {
    let model: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            if model.size == .small {
                Image(model.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .foregroundStyle(Color.customPrimary)
                    .padding(.horizontal, 27)
                    .padding(.vertical, 12)
            } else {
                Text(model.actionName)
                    .font(.helperTextMedium)
                    .foregroundStyle(Color.textSecondary)
                    .padding([.top, .leading], 10)
                Spacer()
                HStack {
                    Spacer()
                    Image(model.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48)
                        .foregroundStyle(Color.customPrimary)
                        .offset(x: 7, y: 7)
                }
            }
        }
        .frame(height: model.height)
        .background(Color.foreground)
        .clipShape(.rect(cornerRadius: model.cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: model.cornerRadius)
            .inset(by: 0.25)
            .stroke(Color.foreground, lineWidth: 0.5)
        )
    }
}

#Preview {
    let model1 = ActionWalletCard.Model(
        size: .small, controlType: .addAccount
    )
    let model2 = ActionWalletCard.Model(
        size: .small, controlType: .seeAll
    )
    
    let model3 = ActionWalletCard.Model(
        size: .medium, controlType: .addAccount
    )
    let model4 = ActionWalletCard.Model(
        size: .medium, controlType: .seeAll
    )
    
    VStack(alignment: .leading) {
        HStack {
            ActionWalletCard(model: model1)
            ActionWalletCard(model: model2)
        }
        HStack {
            ActionWalletCard(model: model3)
                .frame(width: 132)
            ActionWalletCard(model: model4)
                .frame(width: 132)
        }
    }
    .frame(width: 800, height: 800)
    .background(Color.finixBackground)
}
