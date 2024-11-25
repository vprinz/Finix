// Created by Valerie N. Prinz on 18/11/2024.

import SwiftUI

struct ActionSmallWalletCardView: View {
    let model: ActionWalletCardModel
    
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
    let addAccountModel = ActionWalletCardModel(
        actionType: .addAccount
    )
    let seeAllModel = ActionWalletCardModel(
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
