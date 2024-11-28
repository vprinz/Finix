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
        .cardFrame(
            width: 90, height: 60,
            cornerRadius: 10
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
        ActionSmallWalletCardView(model: seeAllModel)
    }
    .padding()
    .background(Color.finixBackground)
}
