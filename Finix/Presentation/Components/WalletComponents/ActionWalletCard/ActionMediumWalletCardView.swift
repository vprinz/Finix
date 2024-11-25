// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

struct ActionMediumWalletCardView: View {
    let model: ActionWalletCardModel
    
    var body: some View {
        VStack(alignment: .leading) {
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
                    .frame(width: 40, height: 40)
                    .foregroundStyle(Color.customPrimary)
                    .offset(x: 7, y: 5)
            }
        }
        .walletCardFrame(
            height: 88,
            backgroundColor: Color.foreground,
            cornerRadius: 12,
            strokeColor: Color.borderStroke
        )
    }
}

#Preview {
    let addAccountModel = ActionWalletCardModel(
        actionType: .addAccount
    )
    let seeAllModel = ActionWalletCardModel(
        actionType: .seeAll
    )
    
    VStack {
        ActionMediumWalletCardView(model: addAccountModel)
            .frame(width: 132)
        ActionMediumWalletCardView(model: seeAllModel)
            .frame(width: 132)
    }
    .frame(width: 800, height: 800)
    .background(Color.finixBackground)
}
