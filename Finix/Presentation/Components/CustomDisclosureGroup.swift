// Created by Valerie N. Prinz on 07/12/2024.

import SwiftUI

extension CustomDisclosureGroup {
    class ViewModel: ObservableObject {
        @Published var isExpanded: Bool
        
        var text: String {
            isExpanded
            ? String(localized: "lessDetailsText")
            : String(localized: "moreDetailsText")
        }
        
        var iconName: String {
            isExpanded ? "chevron-top" : "chevron-bottom"
        }
        
        init(isExpanded: Bool = false) {
            self.isExpanded = isExpanded
        }
    }
}

struct CustomDisclosureGroup: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        Button {
            viewModel.isExpanded.toggle()
        } label: {
            VStack(spacing: 8) {
                Text(viewModel.text)
                    .font(.bodyTextNarrowRegular)
                Image(viewModel.iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14, height: 10)
            }
            .foregroundStyle(Color.textTertiary)
        }

    }
}

#Preview {
    CustomDisclosureGroup(viewModel: .init())
}
