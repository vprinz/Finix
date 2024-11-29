// Created by Igor Uglev on 17.11.24.

import SwiftUI

struct HomeSection: View {
    
    var title: String
    var trasnactionModels: [TransactionExpenseCardView.Model]
    var emptyStateModel: EmptyStateView.Model
    
    var body: some View {
        VStack(spacing: 8) {
            SectionLinkView(sectionTitle: title, showSeeAllButton: !trasnactionModels.isEmpty)
                .padding(.horizontal, 8)
            if !trasnactionModels.isEmpty {
                transactions
            } else {
                emptyState
            }
        }
    }
    
    var transactions: some View {
        VStack(spacing: 0) {
            ForEach(trasnactionModels) { model in
                TransactionExpenseCardView(model: model)
                .padding(.horizontal, 20)
            }
        }
        .cardFrame()
    }
    
    var emptyState: some View {
        EmptyStateView(model: emptyStateModel)
    }
}
