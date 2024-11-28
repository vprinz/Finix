// Created by Valerie N. Prinz on 25/10/2024.

import Foundation
import SwiftUI

class BaseTextInputViewModel: ObservableObject {
    enum State {
        case inactive
        case focused
        case disabled
    }
    
    var placeholder: String
    
    var textColor: Color {
        switch state {
        case .disabled:
            Color.textDisabled
        default:
            Color.textSecondary
        }
    }
    
    var backgroundColor: Color {
        switch state {
        case .disabled: Color.customPrimary.opacity(0.1)
        default: Color.foreground
        }
    }
    
    var borderColor: Color {
        if error != nil {
            return Color.error
        }
        switch state {
        case .focused:
            return Color.customPrimary
        default:
            return Color.borderStroke
        }
    }
    
    @Binding var value: String
    @Published var state: State = .inactive
    @Published var error: String?
    
    init(
        value: Binding<String>,
        placeholder: String = String(localized: "textFieldPlaceholder"),
        disabled: Bool = false
    ) {
        self._value = value
        self.placeholder = placeholder
        if disabled {
            state = .disabled
        }
    }
}
