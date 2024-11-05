// Created by Valerie N. Prinz on 05/11/2024.

import SwiftUI

struct SectionLinkView: View {
    let sectionTitle: String
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.buttonMedium)
            Image("arrow-right")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 8, height: 8)
            Spacer()
            Text("seeAllButton")
                .font(.smallTextMedium)
        }
        .foregroundStyle(Color.textSecondary)
        .padding()
    }
}

#Preview {
    SectionLinkView(sectionTitle: "Upcoming payments")
}
