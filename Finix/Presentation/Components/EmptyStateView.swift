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
            case .recentTransaction: "calendar-and-clock"
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
        HStack(spacing: .zero) {
            Image(model.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 96, height: 72)
                .padding(.leading, 16)
                .padding(.trailing, 8)
            Text(model.text)
                .font(.smallTextTallRegular)
                .foregroundStyle(Color.textSecondary)
                .frame(width: 205)
                .padding(.trailing, 36)
        }
        .cardFrame(height: 106)
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
        EmptyStateView(model: model2)
        EmptyStateView(model: model3)
    }
    .padding()
    .background(Color.finixBackground)
}
