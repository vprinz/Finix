// Created by Igor Uglev on 17.11.24.

import SwiftUI

struct HomeSection: View {
    
    var title: String
    var trasnactionModels: [TransactionExpenseCardView.Model]
    
    var body: some View {
        VStack(spacing: 8) {
            SectionLinkView(sectionTitle: title)
                .padding(.horizontal, 8)
            VStack(spacing: 0) {
                ForEach(trasnactionModels) { model in
                    TransactionExpenseCardView(model: model)
                    .padding(.horizontal, 20)
                }
                .padding(.vertical, 8)
            }
            .cardFrame(
                backgroundColor: Color.foreground,
                cornerRadius: 12,
                strokeColor: Color.borderStroke
            )
        }
    }
}
