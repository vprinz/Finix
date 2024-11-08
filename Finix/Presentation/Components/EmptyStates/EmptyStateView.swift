// Created by Valerie N. Prinz on 08/11/2024.

import SwiftUI

extension EmptyStateView {
    struct Model {
        struct ButtonConfiguration {
            let text: String
            let action: () -> Void
        }
        
        enum State {
            case emptyTransaction
            case emptyLimit
        }
        
        let state: State = .emptyTransaction
        
        var imageName: String {
            switch state {
            case .emptyTransaction:
                return "calendar"
            case .emptyLimit:
                return "goal"
            }
        }
        
        var text: String {
            switch state {
            case .emptyTransaction:
                String(localized: "emptyTransactionText")
            case .emptyLimit:
                String(localized: "emptyLimitText")
            }
        }
        
        var buttonConfig: ButtonConfiguration {
            switch state {
            case .emptyTransaction:
                return .init(
                    text: String(localized: "addTransactionBtnText")) {
                        // DEBUG
                        print("Transaction here")
                    }
            case .emptyLimit:
                return .init(
                    text: "setLimitBtnText") {
                        // DEBUG
                        print("Limit here")
                    }
            }
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    EmptyStateView()
}
