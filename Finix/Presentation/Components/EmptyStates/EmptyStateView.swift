// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension EmptyStateView {
    struct Model {
        enum State {
            case upcomingTransaction
            case recentTransaction
            case limit
        }
        
        var state: State
        let tapAction: () -> Void
        
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
    }
}

struct EmptyStateView: View {
    let model: Model
    
    var body: some View {
        HStack {
            Image(model.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 95, height: 75)
            Text(model.text)
                .font(.smallTextTallRegular)
                .foregroundStyle(Color.textSecondary)
                .multilineTextAlignment(.leading)
        }
        .walletCardFrame(
            height: 106,
            backgroundColor: Color.foreground,
            cornerRadius: 12,
            strokeColor: Color.borderStroke
        )
        .onTapGesture {
            model.tapAction()
        }
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
