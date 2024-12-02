// Created by Valerie N. Prinz on 05/11/2024.

import SwiftUI

struct SectionLinkView: View {
    let sectionTitle: String
    let showSeeAllButton: Bool
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.buttonMedium)
            Image("chevron-right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8, height: 8)
            Spacer()
            if showSeeAllButton {
                Text("seeAllText")
                    .font(.smallTextMedium)
            }
        }
        .foregroundStyle(Color.textSecondary)
    }
}

#Preview {
    VStack(spacing: 40) {
        SectionLinkView(
            sectionTitle: "Wallets",
            showSeeAllButton: false
        )
        SectionLinkView(
            sectionTitle: "Upcoming payments",
            showSeeAllButton: true
        )
    }
    .padding()
}
