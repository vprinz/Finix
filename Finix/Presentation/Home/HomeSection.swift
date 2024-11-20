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
            .background(Color.foreground)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.25)
                .stroke(Color.borderStroke, lineWidth: 0.5)
            )
        }
    }
}
