// Created by Valerie N. Prinz on 05/11/2024.

import SwiftUI

struct SectionLinkView: View {
    let sectionTitle: String
    
    var body: some View {
        HStack {
            Text(sectionTitle)
                .font(.buttonMedium)
            Image("chevron-right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8, height: 8)
            Spacer()
            Text("seeAllText")
                .font(.smallTextMedium)
        }
        .foregroundStyle(Color.textSecondary)
    }
}

#Preview {
    SectionLinkView(sectionTitle: "Upcoming payments")
        .padding()
}
