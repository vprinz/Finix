// Created by Igor Uglev on 17.11.24.

import SwiftUI

struct HomeSection: View {
    
    var title: String
    @State var showButton: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            SectionLinkView(sectionTitle: title)
            // TODO: Add transactions
            Image(systemName: "bag.badge.minus")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(Color.finixPurple)
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .card()
        }
    }
}
