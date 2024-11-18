// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

extension ActionSmallWalletCardView {
    struct Model {
        enum ActionType {
            case addAccount
            case seeAll
        }
        
        let actionType: ActionType
        
        var actionName: String {
            switch actionType {
            case .addAccount:
                String(localized: "Add account")
            case .seeAll:
                String(localized: "Saa all")
            }
        }
        
        var iconName: String {
            switch actionType {
            case .addAccount: "plus-circle"
            case .seeAll: "arrow-right-circle"
            }
        }
    }
}

struct ActionSmallWalletCardView: View {
    let model: Model
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(model.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Color.customPrimary)
                Spacer()
            }
        }
        .walletCardFrame(
            height: 60,
            backgroundColor: Color.foreground,
            cornerRadius: 10,
            strokeColor: Color.borderStroke
        )
    }
}

#Preview {
    let addAccountModel = ActionSmallWalletCardView.Model(
        actionType: .addAccount
    )
    let seeAllModel = ActionSmallWalletCardView.Model(
        actionType: .seeAll
    )
    
    VStack {
        ActionSmallWalletCardView(model: addAccountModel)
            .frame(width: 90)
        ActionSmallWalletCardView(model: seeAllModel)
            .frame(width: 90)
    }
    .frame(width: 800, height: 800)
    .background(Color.finixBackground)
}
